
# Day 4: Configured and Tested Azure Firewall in the Network.

Enabled Network Firewall rule in webvm1
<img width="850" height="501" alt="48" src="https://github.com/user-attachments/assets/2a81525a-75ab-40c3-a862-10ae0c5ef1c4" />

Enabled Network Firewall rule in webvm2
<img width="783" height="499" alt="49" src="https://github.com/user-attachments/assets/d571cba7-c4fd-49c3-adf7-0098670f4059" />

Inspected the route in vm1

<img width="770" height="448" alt="52" src="https://github.com/user-attachments/assets/9e4442f7-d393-446e-ae41-d6b5e722bc16" />

NSG Rule created to Access Internet from VMs.
<img width="696" height="343" alt="53" src="https://github.com/user-attachments/assets/d32ccac5-7b48-4453-8102-016cf925d4dc" />


Tested connection og google.com from vm1
<img width="818" height="388" alt="54" src="https://github.com/user-attachments/assets/e3c5a695-32db-44f6-8f91-7d29bd4c5d31" />
<img width="686" height="482" alt="55" src="https://github.com/user-attachments/assets/9be1e38f-24af-4ea6-b28a-39efa25fd94f" />
<img width="793" height="470" alt="56" src="https://github.com/user-attachments/assets/70f7cfef-0ca4-4b2c-b327-732d23e47e98" /> <br>




Public ip created for firewalll

<img width="696" height="429" alt="57" src="https://github.com/user-attachments/assets/33ab0cde-4759-4e27-81c0-577a7aa1b283" />



Azure Firewall Created and Configured

<img width="704" height="382" alt="58" src="https://github.com/user-attachments/assets/93503333-32c1-45e1-9973-512b9398fafb" />
<img width="704" height="323" alt="59" src="https://github.com/user-attachments/assets/19684f7e-3951-4c99-b219-15f6afd99806" />
<img width="696" height="80" alt="60" src="https://github.com/user-attachments/assets/f834eb1e-2e48-4067-81c4-4ee81ec546d1" />


Created route table and route

<img width="703" height="221" alt="61" src="https://github.com/user-attachments/assets/fe545e02-61f6-46f6-b398-be453531d55f" />
<img width="704" height="241" alt="62" src="https://github.com/user-attachments/assets/a4ca1be7-4ce7-446d-b237-03763e6b7e2f" />
<img width="815" height="479" alt="63" src="https://github.com/user-attachments/assets/1b70f615-2350-4b59-9192-c48cd16bb9d6" />


Updated subnet with route table

<img width="691" height="477" alt="64" src="https://github.com/user-attachments/assets/5f25e5b3-d3bc-47de-9c05-69517fda2789" />

<img width="699" height="479" alt="65" src="https://github.com/user-attachments/assets/2f5417b5-23f7-42bc-84f0-42d4d6cf4b9e" /> <br>




Created network firewall rule

<img width="704" height="337" alt="66" src="https://github.com/user-attachments/assets/bfea1d7a-8d84-4f9a-87ba-b98f14ef7004" />


from vm1 internet worked from microsoftedge browser.

<img width="959" height="533" alt="67" src="https://github.com/user-attachments/assets/1f5b9ee7-91cc-4545-b93c-cdc10eb4cb11" /> <br>





vm1:

<img width="626" height="298" alt="68" src="https://github.com/user-attachments/assets/cb88b0dd-4916-4519-8e00-b2428e758e46" />
<img width="701" height="469" alt="69" src="https://github.com/user-attachments/assets/27a58ba7-8c16-423c-b755-fa9538e062c2" />



# Azure Firewall Proven Test in the network

# 1. Deleted the "AllowInternet" rule from firewall, which wasv created above
<img width="949" height="446" alt="1" src="https://github.com/user-attachments/assets/bd2c209b-a30b-4312-a23f-d9f5547961aa" />
<img width="809" height="414" alt="2" src="https://github.com/user-attachments/assets/4a704522-078e-40f9-a3c5-6d99e1257455" />

Tested the connection of google.com from vm2:
<img width="717" height="426" alt="3" src="https://github.com/user-attachments/assets/60add87f-c2e4-48f9-94a6-1be150040e8e" />

VM2 can't reach the internet
<img width="920" height="523" alt="4" src="https://github.com/user-attachments/assets/dec9df05-0e2d-4748-8187-abed8150e088" />


created the rule again
<img width="703" height="382" alt="5" src="https://github.com/user-attachments/assets/43bb13d4-801b-4736-87db-eb7a5240facd" />
<img width="959" height="519" alt="6" src="https://github.com/user-attachments/assets/dcb00c6a-eec5-4226-b0e0-9f9449a3e3f9" />

# 2. Can see from the route table list that firewall (0.0.0.0/0) is connected to the Vms.
<img width="706" height="125" alt="7" src="https://github.com/user-attachments/assets/8c263de5-1df7-4105-800b-8b840275dde5" />

# 3. can see the vm is connected to the firewall for traffic in show-effective-route-table
<img width="704" height="230" alt="8" src="https://github.com/user-attachments/assets/dc842bae-68fd-45d4-8696-bfd624d5d97a" />

# 4. Firewall Rules:
<img width="958" height="431" alt="9" src="https://github.com/user-attachments/assets/d3b74a23-a678-4b32-83fd-c4260d070b9b" />

# 5. Route table routes:
<img width="938" height="475" alt="10" src="https://github.com/user-attachments/assets/11e51ade-5a08-450c-904b-1ad9ec8fcffc" />


