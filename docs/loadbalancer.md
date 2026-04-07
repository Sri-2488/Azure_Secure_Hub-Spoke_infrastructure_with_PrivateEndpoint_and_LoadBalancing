# Azure Load Balancer - HA Setup
* Azure Load Balancer is used to distribute traffic across vms and simulated this project as real world application setup. The main goal of this is to achieve High availability of Vms.
* Load Balancer has two main things: 
    - Frontend IP means public IP of LB, where the user can connect to webpage in Vms.
    - Backend pool means the VMs.

## Load Balancer traffic flow:
Use ----> Frontend IP ----> Load Balancer ------> Backend Pool (Vm1/Vm2)
- At first, User has to access LB public ip from the browser
- Then, Load Balancer recieves the request
- Then, Health probe checks vms and selects and send request to healthy vm
- Response retuns from LB to the user.


## Implementation Steps:
- Installed IIS on both Vms.
- Added unique webpages in Vms.
- Created a public ip of load balancer in powershell.
- Created Load Balancer.
- Added Vms to Backendpool.
- Created health probe to cjeck vm is alive or not.
- Then, Created load balancing rule by allowing both frontend and backend ports as 80.
- Updated the NSG to allow HTTP Inbound traffic.
- At last, need to get the Public IP of Load balancer and need to browse from the system as http://<loadBalancerIP>

## Issues Raised:
- Sometimes, Vms can have same ip configuration names, so first need to check the ipconfig name and then vms should added to the Backend pool of LB.
- Got an issue in vms, when i tried to open http://localhost in vms, the webpage was not loaded and displayed that cannot open the page and too long to respond. It is because, need to chnage the default browser document settings in Internet Information Server (IIS) manager in vm. need to  check the bindings of the document as well, the ip address should be unassigned, port is 80, and  the host name should be blank. and remove all the iis default documents in that folder.
- Need to add NSG rules to the subnet vms. The vm NICs should attach to the virtual machine and network security group.
- To connect to http://lb public ip from our browser, need to add firewall rule in both vms first.

    "netsh advfirewall firewall add rule name= AllowHttp dir=in action=allow protocol=Tcp localport= 80 "
  
  because of the firewall, the route became asymetric. the firewall blocked all the outbound traffic.
        request : Internet ----> LB ----> VM
        response: VM ----> Firewall -----> Internet 
 so, had removed the route table in web_subnet and made the route flow symmetric.
 Therefore, got the desired output.           
