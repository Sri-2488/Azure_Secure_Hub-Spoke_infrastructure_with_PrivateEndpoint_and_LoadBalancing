# Day 5: Configured the Load Balancer in the network.
Installed the web server in vm1
<img width="859" height="522" alt="1" src="https://github.com/user-attachments/assets/209cd6cb-3ec2-4435-9074-f75080e704a4" />

Installed the web server in vm2
<img width="833" height="445" alt="2" src="https://github.com/user-attachments/assets/ee85161e-13e3-4cc7-8f6d-49a6e69cae30" />

Public ip Created for the load balancer

<img width="702" height="452" alt="3" src="https://github.com/user-attachments/assets/644758e6-f4de-4a2e-957e-6db27dc32827" />

Load Balancer Created and Configured

<img width="707" height="467" alt="4" src="https://github.com/user-attachments/assets/a8c6eea3-fff2-44a1-9e06-6128677a95db" />

<img width="701" height="368" alt="5" src="https://github.com/user-attachments/assets/ec3dcbed-c711-4099-85bd-5b8499fef30c" />

configured the vms to Load balancer backendpool

<img width="703" height="519" alt="6" src="https://github.com/user-attachments/assets/2dbd8cd1-5e49-419c-a01f-323105f794f3" />

Load balancer probe created 

<img width="704" height="236" alt="7" src="https://github.com/user-attachments/assets/8695f318-9866-4977-ae63-3ed55cb2969c" />

rule created 

<img width="703" height="533" alt="8" src="https://github.com/user-attachments/assets/df83c444-2b8d-4b18-a8f6-4a0c10f719af" />
<img width="959" height="346" alt="11" src="https://github.com/user-attachments/assets/3da008da-3122-4bd9-8d3d-ba6fefccfcac" />

<img width="957" height="409" alt="10" src="https://github.com/user-attachments/assets/532a186b-3de7-4cc3-978b-d41e98701f1a" />

Backend Pools
<img width="952" height="404" alt="9" src="https://github.com/user-attachments/assets/5e7951d6-2fc4-4d17-a21c-078295fc7ab0" />

NSG rule Created

<img width="704" height="407" alt="12" src="https://github.com/user-attachments/assets/e61dfdee-876b-4178-b0af-edb35d58aedf" />

<img width="956" height="462" alt="13" src="https://github.com/user-attachments/assets/2f0fd945-b1c2-47c5-a448-83c4081caa71" />

Public ip of Load Balancer

<img width="702" height="116" alt="14" src="https://github.com/user-attachments/assets/ca5e6700-e5f9-449f-9565-e9898e673009" />

Firewall rule created to accept http Inbound

<img width="701" height="461" alt="15" src="https://github.com/user-attachments/assets/e361f3a8-503e-4d17-9383-201fb1142d19" />

NSG rule created to allow Load balancer to the network and added nsg to the subnet as well.

<img width="703" height="442" alt="16" src="https://github.com/user-attachments/assets/18637247-f1fe-45ba-a8ca-c25724e88fe1" />
<img width="833" height="489" alt="19" src="https://github.com/user-attachments/assets/38bee5eb-99b9-4d52-96cc-25de8bd3ecfc" />


firewall rule "AllowHttp" added in vm2:

<img width="650" height="310" alt="17" src="https://github.com/user-attachments/assets/55a34284-2bf5-46ee-8ee7-fca34d6b6bcd" />


firewall rule "AllowHttp" added in vm1:

<img width="670" height="301" alt="18" src="https://github.com/user-attachments/assets/a9c58070-6a1d-413b-bb7b-d03a9b1c204c" />

# Tested the public ip of LB from my 2 different browsers, the distribution of VMs worked:

<img width="770" height="470" alt="20" src="https://github.com/user-attachments/assets/28083cf1-29e0-4288-9c7b-1ba3b74ca561" />


# Tested LB Internally from vm1:

<img width="776" height="501" alt="21" src="https://github.com/user-attachments/assets/13d94b41-ab6d-435d-a52e-53e08d76237c" />

# Tested LB for Distribution of work across Vms and failover backup. 
Stopped the vm1

<img width="703" height="325" alt="22" src="https://github.com/user-attachments/assets/e8f57f99-8fff-416b-8e27-5b566df08634" />

# Failover of vm1 worked, had opened 2 browsers it displays only vm2.

<img width="787" height="439" alt="23" src="https://github.com/user-attachments/assets/95cbd60e-de73-4793-ba8b-0e7ccecdb2ea" />

