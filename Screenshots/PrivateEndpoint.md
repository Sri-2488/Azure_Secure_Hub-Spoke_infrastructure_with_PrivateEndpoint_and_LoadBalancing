# Configured Private Endpoint in Spoke2_subnet and added Storage Service as well.

Created the storage account

<img width="910" height="451" alt="3" src="https://github.com/user-attachments/assets/f267d1c4-28bf-4cac-b9d3-2e44f22d5cea" />

Created the storage container

<img width="701" height="373" alt="4" src="https://github.com/user-attachments/assets/56071bac-ba99-4829-81e4-4b97608e22de" />

Private Endpoint Created

<img width="698" height="529" alt="5" src="https://github.com/user-attachments/assets/47c4e2a7-1f25-4164-904f-c63a2085f654" />
<img width="958" height="443" alt="11" src="https://github.com/user-attachments/assets/7f672a1d-e149-4a71-a9d7-b2023af2735b" />


Private DNS Zone Created 

<img width="704" height="338" alt="6" src="https://github.com/user-attachments/assets/97105ada-216e-4f7c-9135-342104449f8f" />


Created the link between private dns and Spoke2_vnet

<img width="706" height="361" alt="7" src="https://github.com/user-attachments/assets/09fa91f4-d123-4ffa-a40c-1f23ab14be30" />

Created the link between private dns and Spoke1_vnet

<img width="702" height="389" alt="12" src="https://github.com/user-attachments/assets/0e146b72-6689-4d58-b6ff-96be118ff192" />


Created the dns zone group 

<img width="701" height="408" alt="8" src="https://github.com/user-attachments/assets/53650274-46aa-4e26-bab6-a4cc06c786bd" />

Vnet Peering between spoke1_vnet and spoke_vnet

<img width="698" height="459" alt="1" src="https://github.com/user-attachments/assets/7fda7ad1-b019-442a-bdfe-226472fcf198" />
<img width="705" height="465" alt="2" src="https://github.com/user-attachments/assets/2c458f27-0f30-4031-a44b-1da002925837" />
<img width="706" height="187" alt="9" src="https://github.com/user-attachments/assets/b239f8b0-9f23-4704-bec0-ea3312519dc5" />

private DNS Zone name: privatelink.blob.core.windows.net

<img width="959" height="387" alt="10" src="https://github.com/user-attachments/assets/00f5e26b-c34b-4f37-85b5-e07320ef314e" />



# Tested DNS Private IP and DNS Zone Name from vm2:

<img width="734" height="445" alt="13" src="https://github.com/user-attachments/assets/f7a726b2-53d6-491a-a4ba-c25992ee62dd" />

Haven't got the desired output from browser, but can be able to get private ip of DNS from powershell

<img width="877" height="398" alt="14" src="https://github.com/user-attachments/assets/582d49ed-98a3-41dc-b3d1-21b122bfa62a" />

Created and uploaded the "testfile.txt" in vm2 to storage

<img width="751" height="281" alt="15" src="https://github.com/user-attachments/assets/5a9f8efe-27f8-42d1-8f9a-899fb47970d7" />

Downloaded the microsoft azure cli and login ined the azure account in vm2 to run commands to the storage

<img width="568" height="356" alt="16" src="https://github.com/user-attachments/assets/b5869ad7-18a2-4dc4-9617-064e57693fd2" />

Assigned the Storage blob data contributor role to my account for doing actions on storage acoount, i need previledge access for that.

<img width="959" height="370" alt="17" src="https://github.com/user-attachments/assets/79f7b2f1-a8b5-48cb-9098-ec9797d5772d" />

uploaded the testfile.txt to the storage

<img width="772" height="376" alt="18" src="https://github.com/user-attachments/assets/0b4f0b5d-39e5-4ac3-b402-91e954e682a1" />

Updated the storage account by disabling public access

<img width="658" height="477" alt="19" src="https://github.com/user-attachments/assets/f565b5ca-b802-458e-ac5b-902b39aaaf94" />

Generated the SAS Token, make me to access testfile through private-dns-zone 

<img width="745" height="302" alt="20" src="https://github.com/user-attachments/assets/32f61020-813e-438f-ab3f-d02af61be94c" />



# Got the Output from the browser, can be able to open testfile.txt from storage using https://$Storage_name.blob.core.windows.net 

<img width="959" height="357" alt="21" src="https://github.com/user-attachments/assets/6263ff78-a9c0-4da2-a728-b2b31b901c82" />

Couldn't be able to open that file using https://$Storage_name.blob.core.windows.net url from my browser, because public access is disabled for storage account

<img width="901" height="455" alt="22" src="https://github.com/user-attachments/assets/ea28e417-86fe-4fcb-bef7-7c38f3d9ec25" />

Created and uploaded the logs.txt in the storage from vm2.

<img width="688" height="385" alt="23" src="https://github.com/user-attachments/assets/42d99fb2-61a5-4dfe-aa09-ea80bb3e6f92" />

Created File share option

<img width="850" height="404" alt="24" src="https://github.com/user-attachments/assets/fd002542-2701-4059-bd39-ae4164fa2c49" />


# Managed Identity for the storage account access

Identity assigned for the webvm2

<img width="677" height="460" alt="25" src="https://github.com/user-attachments/assets/c6e10140-a113-496d-8c6f-9c8ffb644f68" />

# Verified DNS Resolution from VM2

<img width="803" height="380" alt="26" src="https://github.com/user-attachments/assets/8d12d4d1-8ee3-4157-b98c-722d118d101f" />
