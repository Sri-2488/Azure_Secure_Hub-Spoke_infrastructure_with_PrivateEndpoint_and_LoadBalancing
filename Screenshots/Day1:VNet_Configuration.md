# Day1: Installed Azure CLI and Created Vnets and Subnets.

Installed the Microsoft Azure CLI in my system.

<img width="858" height="368" alt="1" src="https://github.com/user-attachments/assets/80dcf0fd-e0bd-4c1b-8a98-ef2394ed5e7a" />


The version of Azure I ahve in my system:

<img width="853" height="250" alt="2" src="https://github.com/user-attachments/assets/dd5a0c1e-81b8-4888-8ca1-de9b87dbba5b" />


Had logged in my azure account in the powershell.

<img width="858" height="458" alt="3" src="https://github.com/user-attachments/assets/cfc53587-f19f-431e-ac33-221398645b7d" />


Retrived my subscription of azure portal through powershell.

<img width="821" height="101" alt="4" src="https://github.com/user-attachments/assets/a2ed5fef-86b6-4590-a4f4-0d194f1d8b93" />


Had Created a PRoject folder and named as Hub_Spoke_Azure_Project in my system.

<img width="861" height="230" alt="5" src="https://github.com/user-attachments/assets/00a9b332-45b4-438a-8c45-d9ebdad958e4" />

Had  created a .ps1 file to store all my commands used in my project in each step of implementation.

<img width="637" height="175" alt="6" src="https://github.com/user-attachments/assets/7a4aa80d-d685-4fc4-94e5-3ea14b7c5b2b" />


Created a Resource Group in Azure portal from my powershell.

<img width="851" height="336" alt="7" src="https://github.com/user-attachments/assets/f4eed084-e547-4209-ad7e-750a2e1c55cb" />

<img width="845" height="403" alt="8" src="https://github.com/user-attachments/assets/a8e52033-a0e4-432d-9f00-0ccfc2807c6d" />

Created a hub_vnet Virtual network  and a subnet called AzureFirewallSubnet to route all the traffic from spoke subnets to the firewall in the resource group hubspoke_rg.

<img width="854" height="557" alt="9" src="https://github.com/user-attachments/assets/0ac6830e-a11f-4399-9566-8c3c62e2165e" />

<img width="843" height="413" alt="10" src="https://github.com/user-attachments/assets/5412766f-4c40-4616-9f11-73ffce71014a" />


Created an AzureBastionSubnet in hub_vnet to connect the vms via RDP/SSH privately without exposing them to the public internet.

<img width="854" height="403" alt="11" src="https://github.com/user-attachments/assets/980880de-76ad-4695-bf25-9f4456ab94fd" />

<img width="953" height="406" alt="12" src="https://github.com/user-attachments/assets/406f8d7b-fae2-4291-8111-3ae9d3b7c213" />



Created "Spoke1_vnet" and a subnet called "web_subnet" to deploy vms in it and also "spoke2_vnet" with a subnet called "private_endpoint" for private endpoint (used to access any serive privately without public IP).

<img width="416" height="329" alt="image" src="https://github.com/user-attachments/assets/73a63539-0468-4b67-8e6f-ae7b6b4adf16" />

<img width="415" height="330" alt="image" src="https://github.com/user-attachments/assets/022d0472-6f6d-4313-a9ac-13b8e8d6f500" />

<img width="844" height="419" alt="image" src="https://github.com/user-attachments/assets/941ba645-37b7-4f7a-a295-4cec66e1fd82" />

<img width="615" height="523" alt="26" src="https://github.com/user-attachments/assets/e38e9017-8909-43af-b567-58641b9b248e" />

<img width="827" height="409" alt="27" src="https://github.com/user-attachments/assets/453b8697-d581-4daf-a21e-b90cd8b7197a" />

