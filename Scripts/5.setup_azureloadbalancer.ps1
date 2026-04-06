Delpoyment of Azure Load Balancer
- to distribute taffic across vms
- simulate real web application setup
- Achieve high availability.

User------> Loaad balancer ------> vm1/vm2 

# 1. Installed the IIS on both vms.

      Install-WindowsFeature -name web-server -IncludeMAnagementTools

# 2. created unique web pages on both the vms.

 vm1:
      echo "Hello from vm1, recieved request from user" > C:\inetpub\wwwroot\httprequest.html
 vm2: 
      echo "Hello from vm2, recieved request from user" > C:\inetpub\wwwroot\httprequest.html

# 3. Created the load balancer public ip first.

    az network public-ip create '
     --resource-group $RG '
     --name lb_ip '
     --sku Standard '
     --location $location 

# 4. Create the load balancer
  
      az network lb create '
       --resource-group $RG '
       --name web_lb '
       --sku Standard '
       --public-ip-address lb_ip '
       --frontend-ip-name lb_frontend '
       --backend-pool-name lb_backend

#here frontend ip ----> is a public ip, where user can connect to vms via load balancer.
      backend pool ----> is a set of vms connected to load balancer, should be morethan 1.

# 5. Added both vms to backend pool  
     #first need to get the ip configuration name for both vms:
           az vm show '
             --resource-group $RG '
             --name webvm1 '
             --query "networkProfile.networkInterfaces[0].id" '
             --output tsv
        output: ipconfig1

   vm1: 
        az network nic ip-config address-pool add '
          --resource-group $RG '
          --ip-config-name ipconfig1 '
          --nic-name webvm1 '
          --address-pool-name lb_backend '
          --lb-name web_lb

    The same way only nic-name should be change for vm2, the both vms ip configuration name is same.

# 6. Created a health probe --> it is actually a brain for the load balancer. checks if vm is alive and if service is working or not? 

           az network lb probe create '
             --resource-group $RG '
             --lb-name web_lb '
             --name http_probe '
             --protocol Tcp '
             --port 80

# 7. Created a load balancing rule

            az network lb rule create '
             --resource-group $RG '
             --lb-name web_lb '
             --probe-name http_probe '
             --name http_rule '
             --protocol tcp '
             --frontend-port 80 '
             --backend-port 80 '
             --frontend-ip-name lb_frontend '
             --backend-pool-name lb_backend 

# 8. updated the NSG rule to allow http traffic from internet to vms.

            az network nsg rule craete '
             --resource-group $RG '
             --nsg-name $NSG '          #$NSG = "spoke_ndg"
             --name AllowHTTP '
             --priority 150 '
             --direction Inbound '
             --access Allow '
             --protocol Tcp '
             --destination-port-ranges 80 

# 9. need to get load balancer public ip
   
             az network public-ip show '
              --resource-group $RG '
              --name lb_ip '
              --query ipAddress '
              -o tsv

# 10. need to browse http:// <load balancer public IP> ----> will get webpages from vm
      each browser will get one vm at a time. 


# 11. Failover test

       can stop vm1 
           az vm stop --name webvm1 --resource-group $RG 
     can try again the public ip in browsers, will get only vm2 response in all the browsers.

How lb works: 

    User <---------> Frontend IP of LB <-------> Load balancer <-------> Backend Pool (Vms)

     1. User browse the frotendip of lb
     2. Load balancer recieves request
     3. HEalth probe check vms condition
     4. Selects the healthy vm
     5. Sends request to the specific vm
     6. Response returned to user.


Issues raised and solved while doing this part: 

1. Got the "Resource not found" error while i tried to attach vms to load balancer
   had named 2 different ip configuration names first, then later checked for the both ip configuration ids 
   and then i came to know that the both vms had same ip configuration name.

2. Got an issue in vms, when i tried to open http://localhost in vms,
   the webpage was not loaded and displayed that cannot open the page and too long to respond.
   It is because, need to chnage the default browser document settings in Internet Information Server (IIS) manager in vm.
   need to  check the bindings of the document as well, the ip address should be unassigned, port is 80, and 
   the host name should be blank. and remove all the iis default documents in that folder.

3. Need to add NSG rules to the subnet vms. The vm NICs should attach to the virtual machine and network security group.

4. To connect to http://lb public ip from our browser, 
   - need to add firewall rule in both vms first.
      
         netsh advfirewall firewall add rule name= AllowHttp dir=in action=allow protocol=Tcp localport= 80

    - because of the firewall, the route became asymetric. the firewall blocked all the outbound traffic.
        request : Internet ----> LB ----> VM
        response: VM ----> Firewall -----> Internet 
      so, had removed the route table in web_subnet and made the route flow symmetric.
      Therefore, got the desired output.           


