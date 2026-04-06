Azure Firewall Deployment +UDR

UDR with firewall is to enforce centrallized traffic inspection
by routing all outbound traffic through a firewall instead of allowing direct internet access.

#Things to do:
- Need to deploy azure firewall.
- Route all the vm traffic to the firewall.
- Need to control the internet access centrally. 

# Have already created the AzureFirewallSubnet and assigned the ip address range as 10.0.1.0/24 before in setup.nsgandvms

# assigned public ip for firewall before creating it.

   az network public-ip create '
    --resource-group $RG '
    --name fw_ip '
    --sku Satndard ' 
    --location $location

# created a firewall 
   
   az network firewall create '
     --resource-group $RG '
     --name hub_firewall '
     --location $location

# Attached the ip config to firewall

    az network firewall ip-config create '
     --resourec-group $RG '
     --name fw_config '
     --firewall-name hub_firewall '
     --public-ip-address fw_ip '
     --vnet-name $Hub_Vnet

# get the firewall private ip from the below command

    az network firewall show '
     --resource-group $RG '
     --name hub_firewall '
     --query "ipConfigurations[0].privateIPAddress" '
     --output tsv

  will get output: 10.0.1.4

# need to save firewall private ip 

$FW_PRIVATE_IP = "10.0.1.4"

#created the route table 

    az network route-table create '
      --resource-groupm $RG '
      --name spoke_rt '
      --location $location

# created the route for route table
 
    az network route-table route create '
      --resource-group $RG '
      --name route_to_fw '
      --route-table-name spoke_rt '
      --address-prefix 0.0.0.0/0 '
      --next-hop-type VirtualAppliance '
      --next-hop-ip-address $FW_PRIVATE_IP 

# Associated the route table to Spoke1 AzureFirewallSubnet

     az network vnet subnet update '
      --resource-group $RG '
      --name web_subnet '
      --vnet-name spoke1_vnet '
      --route-table spoke_rt

# tryed to connect google.com in vm1, it says false
      
      Test-NetConnection google.com -port 443 

    output: False

# bescause untill have created only firewall and route table,
  need to add a  network firewall rule to the firewall as well

        az network firewall network-rule create '
          --resource-group $RG '
          --firewall-name hub_firewall '
          --collection-name AllowInternet '
          --name AllowGoogle '
          --protocols TCP '
          --source-addresss "*" '
          --destination-address "*" '
          --destination-ports 80 443 '
          --action Allow '
          --priority 100

#Need to test again using Test-NetConnection google.com --port 443 in vm1, 
# Now get the output as true. 

Have done here: 
- All traffic from vms ------> Firewall
- Central control
- Can allow/block anything.

Spoke1 vnet ------------> Firewall ------------> Internet
    |
web subnet
 -------
  /     \
webvm1  webvm2




Troubleshoot: 

# how can we say that vm traffic is going to the firewall 

1. Need to delete the firewall rule and open the browser, the interent connection gonna firewall
   Add the firewall rule back, open the broser and search for anything,  gonna connect.

2. check the route table ( UDR proof) : #10.0.1.4 is firewall ip
    
     az network route-table route list '
        --resource-group $RG '
        --route-table-name spoke_rt '
        --output table 
    
    output:  Address prefix   Next hop Tye          Next Hop ip
              0.0.0.0/0       VirtualAppliance        10.0.1.4

3. check the effective route:

      az network nic show-effective-route-table '
        --resource-group '
        --name webvm1 '
        --output table
    
      output:  0.0.0.0/0 --> VirtualAppliance ---> 10.0.1.4

4.  Vizual proof, in microsoft azure portal: 
  
    - spoke_rt (route table) ---> Routes
     will get : 0.0.0.0 -----> Firewall

    - hub_firewall ( firewall) ----> Rules
    will get: Firewall rule that we assigned before : AllowInternet ---> AllowGoogle