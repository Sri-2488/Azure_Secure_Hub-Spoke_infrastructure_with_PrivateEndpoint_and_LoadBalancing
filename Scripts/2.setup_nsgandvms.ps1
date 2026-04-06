Security and VM Deployment 
- lock downed the network using NSG ( Network Security Group)
- Deployed vms with no public access

Have created NSG for subnets here.

 #created the NSG 
      $NSG = "Spoke_nsg"

  #Allowed RDP only from our IP
 
       $MYIP = $( curl -s ifconfig.me) or 
       $MYIP = (Invoke-RestMethod -Uri "https://ifconfig.me")

  #created the NSG rule 
        
        az network nsg rule create '
        --resource-group $RG '
        --nsg-name $NSG '
        --name ALLOW_RDP_MYIP '
        --priority 100 '
        --source-address-prefixes $MYIP '
        --destination-port-ranges 3389 '
        --access Allow '
        --protocol TCP

 # Attached the NSG rule to subnets 

  #Attached to Spoke1
   
        az network vnet subnet update'
        --resource-group $RG '
        --vnet-name $Spoke1_vnet '
        --name web_subnet '
        --network-security-group $NSG 
  
  # Attached to Spoke2

        az network vnet subnet update '
        --resoucr-group $RG'
        --vnet-name $Spoke2_vnet '
        --name app_subnet '
        --network-security-group $NSG 

# Created the vms with no Public Ips
#First need to create NIC (Network Interface card) before creating vms.

#vm1: 
  
    az network nic craete '
     --resource-group $RG '
     --name webvm1NIC '
     --vnet-name $Spok1_vnet '
     --subnet web_subnet

    az vm create '
    --resource-group $RG '
    --name webvm1 '
    --image Win2019Datacenter '
    --admin-username host '
    --admin-password vm1Host@123! '
    --nics webvm1NIC '
    --size Standard_D2s_v5                    #it takes 2 cores of quota quantity in azure

#vm2: 

    az network nic craete '
     --resource-group $RG '
     --name webvm2NIC '
     --vnet-name $Spok1_vnet '
     --subnet web_subnet

    az vm create '
    --resource-group $RG '
    --name webvm2 '
    --image Win2019Datacenter '
    --admin-username vm2admin '
    --admin-password Vm2admin@123! '
    --nics webvm2NIC '
    --size Standard_D2s_v5    

To verify deployment of vms, the below command can be used

az vm list -d --output table