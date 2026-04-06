#Private EndPoint
# Can Access a service privately with private endpoint witho no expose to public internet.
# VM ------> Private Endpoint (Private IP)------> Storage

$RG = "hubspoke_rg"
$location = "location"
$Storage_name = sristorageinsubnet2

#Created a storage account first.

      az storage account create '
        --resourc-group $RG '
        --name sristorageinsubnet2 '
        --sku Standard '
        --location $location 

#Created a container 

      az storage container create '
       --resource-group $RG '
       --name storage-container '
       --auth-mode login

#Created a subnet in spoke2 

    az network vnet subnet create '
     --resouce-group $RG '
     --name private_subnet '
     --vnet-name spoke2_vnet '
     --address-prefix 10.3.1.0/24

#Created a private endpoint

     az network private-endpoint create '
      --resouce-group $RG '
      --name storage-pe '
      --vnet-name spoke2_vnet '
      --subnet private_subnet '
      --private-connection-resource-id $ ( az storage account show'
                                            --name $Storage_name '
                                            --resource-group $RG '
                                            --query id '
                                            --output tsv) '
      --group-id blob '
      --connection-name storage-connection

#Created a Private DNS Zone

    az network private-dns zone create '
      --resource-group $RG '
      --name privatelink.blob.core.windows.net

#Linked dns zone to both VNets

    az network private-dns link vnet create '
     --resource-group $RG '
     --name dns-link '
     --virtual-network spoke2_vnet '
     --zone-name privatelink.blob.core.windows.net '
     --registration-enabled false

    az network private-dns link vnet create '
     --resource-group $RG '
     --name dns-link2 '
     --virtual-network spoke1_vnet '
     --zone-name privatelink.blob.core.windows.net '
     --registration-enabled false

#Connected dns to private endpoint

    az network private-endpoint dns-zone-group create '
     --resource-group $RG '
     --endpoint-name storage-pe '
     --name dns-zone-group '
     --private-dns-zone privatelink.blob.core.windows.net '
     --zone-name privatelink.blob.core.windows.net

#Vnet Peering Spoke1_vnet and spoke2_vnet

     az network vnet peering craete '
      --resource-group $RG '
      --name spoke1_to_spoke2 '
      --vnet-name spoke1_vnet '
      --remote-vnet spoke2_vnet '
      --allow-vnet-access 

    az network vnet peering craete '
      --resource-group $RG '
      --name spoke2_to_spoke1 '
      --vnet-name spoke2_vnet '
      --remote-vnet spoke1_vnet '
      --allow-vnet-access 

#can test from vm, it gonna work.

  nslookup sristorageinsubnet2.blob.core.windows.net

  output: 10.3.1.4

#Now the nslookup gonna work, but the browser url https://sristorageinsubnet2.blob.core.windows.net not gonna work because of the public ip.

#uploaded and access files privately

  #created a text file inside vm:
     echo "Hello Private Storage-- request from vm to storage " > testfile.text
  
  #uploaded the file to the storage from vm, has to login azure account in vm

     az storage blob upload '
      --account-name $Storage_name '
      --container-name storage-container '
      --name testfile.txt '
      --file testfile.txt '
      --auth-mode login 

# https://$Storage_name.blob.core.windows.net  -- not gonna work, because of the piublic access from browesr

# lockdown public access
   
    az storage account update '
      --name $Storage_name '
      --resource-group $RG '
      --public-network-access Disabled

#For url to work, need the SAS token ( Temporary secure access)

#created a sas token 

  az storage blob generate-sas '
   --resource-group $RG '
   --container-name storage-container '
   --name testfile.txt '
   --permissions r '
   --expiry 2026-11-28 '
   --hhtps-only 

# if open url in the vm browser, will get ouput as Hello Private Storage-- request from vm to storage
#if we open from our laptop browser it not gonna workout, because of public access locked.

#Identity Based Access 
#first will get principal id of vm: 

   az vm show '
     --resource-group $RG '
     --name webvm2 '
     --query identity.principalId '
     -o tsv

#Assign identity to vm: 
  
  az vm identity assign '
   --resource-group $RG '
   --name webvm2 '
   --resource-group $RG '

#Give permission : 
   
   az role assignment create '
     --assignee <VMPrincipalID>
     --role " Storage Blob Data Contributor " '
     --scope $ ( az storage account show '
                   --name $Storage_name '
                   --resource-group $RG '
                   --query id '
                   --output tsv)


# USe Storage as Application Backend

# Inside vm, 
   
   echo "VM log Entry" >>logs.txt

#uploded to storage account from vm: 
  
  az storage blob update '
   --resource-group $RG '
   --container-name storage-container '
   --name logs.txt '
   --file logs.txt '
   --auth-mode login 

#Tested Private DNS deeply 
#inside vm:
  nslookup sristorageinsubnet2.blob.core.windows.net 
#then:
  Reslove-DnsName sristorageinsubnet2.blob.core.windows.net 

  output : will see azure ip, Private IP, Private DNS Zone name

  # At last, from vm browser with https://$Storage_name.blob.core.windows.net url can be able to access storage account files.
  # with anyother browser otherthan vms cant be able to access storage account files.
   