# Day2: Configured NSGs and Deployed VMs in web_subnet which is in SPoke1_vnet

Created a NSG and named as spoke_nsg, stored in $NSG variable.

<img width="449" height="76" alt="13" src="https://github.com/user-attachments/assets/f214c6cc-3254-44af-a7a9-ade626915062" />

<img width="956" height="563" alt="14" src="https://github.com/user-attachments/assets/02b9b160-58cb-4f3f-80be-b791bede8c4d" />

<img width="839" height="413" alt="15" src="https://github.com/user-attachments/assets/e5b3fe06-f337-4373-bbd2-b2a28623bb5a" />

Stored Public IP of my system in  $MYIP variable.

<img width="959" height="296" alt="16" src="https://github.com/user-attachments/assets/061abd63-0b10-4f1e-8c78-82c375a84de8" />

<img width="507" height="239" alt="17" src="https://github.com/user-attachments/assets/e681bb88-8573-4c1f-bc65-a4a6b56a344c" />

Created a NSG spoke_nsg in Resource group hubspoke_rg

<img width="868" height="559" alt="18" src="https://github.com/user-attachments/assets/ac0b88a0-0001-44c7-a65e-9c3025ebb0b3" />

<img width="850" height="365" alt="19" src="https://github.com/user-attachments/assets/d2c72de3-c3bd-474d-a81e-84c377622814" />

<img width="585" height="503" alt="20" src="https://github.com/user-attachments/assets/c7c34e0a-b7b1-4047-8c68-56689a946416" />

Created a NSG rule, where only my system can be able to access the vms by allowing 3389 (RDP) port.

<img width="1312" height="1048" alt="21" src="https://github.com/user-attachments/assets/6b957c28-92d4-41c1-be9c-53dd379662d2" />

<img width="1781" height="957" alt="22" src="https://github.com/user-attachments/assets/1475675a-4451-4588-a9ab-54cbb844230d" />

To Create Vms, First need to  create Network Interface card (NIC) for vm.
Created a webvm1NIC for vm1.

<img width="617" height="559" alt="29" src="https://github.com/user-attachments/assets/1a586259-4c12-41a0-8ab8-ff14b6fe0610" />

Created and configured a webvm1 deployed in web_subnet.

<img width="689" height="366" alt="30" src="https://github.com/user-attachments/assets/bacf6144-2a92-4b28-b4a2-40220edd6009" />

<img width="928" height="491" alt="31" src="https://github.com/user-attachments/assets/fe797732-2914-41be-8079-4256612e007e" />

Created a webvm2NIC for vm2.

<img width="683" height="541" alt="32" src="https://github.com/user-attachments/assets/1c7a5940-020b-4d0e-872b-9bff494bf54e" />

Created and configured a webvm2 deployed in web_subnet.

<img width="688" height="329" alt="33" src="https://github.com/user-attachments/assets/26bf9891-c65a-43f7-a652-5fc25eef6a2b" />

<img width="841" height="511" alt="34" src="https://github.com/user-attachments/assets/1a60b245-ad63-46c1-ac36-46112022a9ba" />


Checked the both vms state.

<img width="539" height="302" alt="35" src="https://github.com/user-attachments/assets/46b11195-7860-4a30-a8c9-1f8d728e61f7" />

