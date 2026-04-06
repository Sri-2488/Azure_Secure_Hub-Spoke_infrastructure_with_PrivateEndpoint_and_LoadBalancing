VNet Peering + Bastion :
  - need to connect networks (Hub->Spoke1)
  - Deploy the Bastion in network 
  - Vms can access securely through browser in Azure Portal

 #Vnet Peering
$Hub_Vnet = "hub_vnet"
$Spoke1_Vnet = "spoke1_vnet"

  #Hub --> Spoke1
     
     az network vnet peering create '
      --resource-group $RG '
      --name hub_to_spoke1 '
      --vnet-name $Hub_Vnet '
      --remote-vnet $Spoke1_Vnet '
      --allow-vnet-access

 #Spoke1 --> Hub

      az network vnet peering create '
      --resource-group $RG '
      --name spoke1_to_hub '
      --vnet-name $Spoke1_Vnet '
      --remote-vnet $Hub_Vnet '
      -allow-vnet-access 

#To verify Peering

    az network vnet peering list '
     --resource-group $RG '
     --vnet-name $Hub_Vnet '
     --output table 

#Created the bastion public ip first
     
     az network public-ip create '
      --resource-group $RG '
      --name bastion-ip '
      --sku Standard '
      --location $location

#Delpoyed the bastion

     az network bastion create '
      --resource-group $RG '
      --name bastion_host '
      --public-ip-address bastion-ip '
      --vnet-name $Hub_Vnet '
      --location $location 
#Can Connect to the vms securely through browser using RDP in azure portal.

#Bastion is used to connect vms (RDP/SSH) securely via browser.
#There is no need of public ip on vm, no open port to internet from vms and need to access through azure portal.
#Bastion is a very secure way to connect but it is too expensive.
our browesr -----> Azure portal ---> Bastion -----> Private VM


---------------------------------------------------------------------------------------------------

#Issues while test connectivity:

#Had an issue with the pinging of 2 vms,its because of the icmpv4 packets,so enable the firewall rule in the both vms.

    Enable-NetFirewallRule -DisplayGroup "File and Printer Sharing"  

   #the both vms can be able to ping eachother after the above command executed.

   Test-NetConnection <PRIVATE_IP> -Port 3389    #---> true, means they can ping each other.


#ping.google.co didn't work in the both vms,it's because of Outbound traffic is not listied in the network security group, so have created a nsg rule for outbound traffic.

          az network nsg rule create'
           --resource-group $RG '
            --nsg-name $NSG '
            --name Allow-Internet-Out '
             --priority 300 '
             --direction Outbound '
             --access Allow '
             --protocol "*"  '
             --destination-address-prefixes Internet '
             --destination-port-ranges "*"

           Test-NetConnection google.com -Port 443   #----->true, the real network connectivity uses TCP (https-443)

           or

           curl https://google.com  #---> application level connectivity

     #google.com is connecting through both vms via network connectivity, but the ping request is timing out because of the icmpv4 packets are often being blocked by external servers or firewall. Therefore, the connectivity is tested using application-level protocols.