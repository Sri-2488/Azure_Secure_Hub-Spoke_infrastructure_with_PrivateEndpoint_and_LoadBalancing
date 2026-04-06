Creation of Resource Group, Hub and Spoke VNets and Subnets 

#Installed the Azure CLI in powershell using below command.

    winget install Microsoft.AzureCLI

#This command displays the version of Azure.

    az version

#used to login azure account by continuing the specific account.

    az login

#displays subscriptions

    az account list --output table 

#set the subscription using the below command, in this project the subscription name is mysub.

    az account set --subscription mysub


#created a project folder, name is Hub_Spoke_Azure_Project.

    mkdir Hub_Spoke_Azure_Project

#changed the directory to the folder.
 
    cd Hub_Spoke_Azure_Project

#created the first script file.

     New-Item setup.hubspoke

# created the resource group and added the location.

     $RG = "hubspoke_rg"
     
     $location = "australiaeast"

     az group create --name $RG --location $location 

# the next step is to plan the ip addressing. 
# Hub Vnet           ------> 10.0.0.0/16
    Firewall         ------> 10.0.1.0/24
    Bastion          ------> 10.0.2.0/24

  Spoke1             ------> 10.2.0.0/16
    WebSubnet        ------> 10.2.1.0/24

  Spoke2             ------> 10.3.0.0/16
    AppSubnet        ------> 10.3.1.0/24

 Private Endpoint    ------> 10.3.1.x

# created the network called vnet and subnet AzureFirewallSubnet.

      az network vnet create '
      --resource-group $RG '
      --name hub_vnet '
      --address-prefix 10.0.0.0/16 '
      --subnet-name AzureFirewallSubnet '
      --subnet-prefix 10.0.1.0/24 

#created the subnet called AzureBastionSubnet in hub_vnet.

     az network vnet subnet create ' 
     --resource-group $RG '
     --vnet-name hub_vnet '
     --name AzureBastionSubnet '
     --address-prefix 10.0.2.0/24

$Spoke1_vnet = "spoke1_vnet"
$Spoke2_vnet = "spoke2_vnet"
#created spoke1_vnet 

     az network vnet create '
    --resource-group $RG '
    --name $Spoke1_vnet '
    --address-prefix 10.2.0.0/16 '
    --subnet-name web_subnet '
    --subnet-prefix 10.2.1.0/24

#created spok2_vnet

    az network vnet craete '
    --resource-group $RG '
    --name $Spoke2_vnet '
    --address-prefix 10.3.0.0/16  '
    --sunet-name app_subnet '
    --subnet-prefix 10.3.1.0/24 

Have done 
- azure installation in powershell and project folder creation 
- created Resource group
- planned the IP addressing of thge network
- created Vnets - Hub, Spoke1, Spoke2  and their subnets 