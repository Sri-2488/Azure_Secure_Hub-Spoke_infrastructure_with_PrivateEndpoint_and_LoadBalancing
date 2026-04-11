# Azure_Secure_Hub-Spoke_infrastructure_with_PrivateEndpoint_and_LoadBalancing
Designed a multi-layer Hub-Spoke network architecture by implementing internet access with NSG rules, Bastion and Azure Firewall. Configured Load balancing for high availability of VMs and enabled the private connectivity for Azure Storage service using private endpoint.
Automated Deployment using Azure CLI scripts for all components including networking, security, load balancing and private endpoint configuration.

# Architecture Components
 * Hub Vnet (10.0.0.0/16) 
    - Azure Firewall (Centralized traffic Control) - 10.0.1.0/24
    - Azure Bastion (Private Access for VM) - 10.0.2.0/24
 * Spoke1 Vnet (10.2.0.0/16)
    - Web_subnet (Deployed Vms) - 10.2.1.0/24
 * Spoke2 Vnet (10.3.0.0/16)
    - Private_subnet (Private Endpoint + Storage) - 10.3.1.0/16

# Network Design 

<img width="841" height="831" alt="architecture_diagram" src="https://github.com/user-attachments/assets/05909528-ec66-4308-b4d7-7af38157e69e" />



# Connectivity using VNet Peering
- Hub <-> Spoke1 (Vnet Peering)
- Hub <-> Spoke2 (Vnet Peering)
- Spoke1 <-> Spoke2 (Vnet Peering) 

This enables secure communication between VNets without exposing network to public.

# Security Implementation
<b2> Network Security Group (NSG) </b2>
- NSG is used here to lockdown network.
- Denied all Public Inbound to the network by default.
- Only Specified IP can access the network using port 3389 (RDP).
- Allowed port HTTP(80) for web traffic and Azure Load Balancer probes.

<b2> Azure Firewall </b2>
- Azure Firewall is deployed to route all the outband traffic in the network through a firewall by configuring User Definied Routes(UDR).
- Created the firewall network rule to allow the ports 80 and 443 to access https://google.com in the vms browser, got the desired output.
- It controlls Internet access centrally. 

<b2> Azure Bastion </b2>
- It is a Secure way to connect VMs by RDP/SSH via browser.
- No public ip is used on vms and no open ports to the internet.
- It improves the security of the vms.
- Can connect the created vms in azure portal via bastion from my browser.

# Load Balancing
- Azure Load Balancer is used to distribute traffic across both the vms and can allocate work to one vm if another vm is unhealthy.
- Health probes monitor VM availability.
- Ensures High availabity and fault tolerance.
- Tested the load balancer public ip (https://<loadbalancerpublicip>) url from vms and browsers in my laptop, and got the desired output, but the url didn't work in other systems because of the public access and request did not come from the internal network.
  
 # Private Endpoint Implementation
 - Private Endpoint is used in the project to access a storage service privately without public internet.
 - Vms from spoke1 Vnet can connect to the Storage service and perform actions like uploading, updating or deleting a file in the storage using a private DNS zone.
 - The Private DNS zone is privatelink.blob.core.windows.net.
 - blob group id from storage is used for object Storage (Files, images, backups,logs,etc).
 - Verified DNS resolution from vm2 and got the private ip and dns zone name as output.

# Validation 
- VM Connectivity tested via Bastion. 

  Outputs: 
  
  VM1: 
  
    <img width="783" height="461" alt="image" src="https://github.com/user-attachments/assets/2d599e3c-0d01-4481-b9f1-202071bcbb53" />
    <img width="776" height="378" alt="image" src="https://github.com/user-attachments/assets/25facde9-7b4a-4acb-991b-a2efe830730f" />
  
VM2:

 <img width="832" height="470" alt="image" src="https://github.com/user-attachments/assets/0eec5029-2925-4380-9fd8-939ad6f95922" />
 <img width="777" height="396" alt="image" src="https://github.com/user-attachments/assets/8a96558f-3a2e-4dee-8cdb-207c51dceb59" /> 


- Load Balancer tested using Public IP.

<img width="776" height="501" alt="image" src="https://github.com/user-attachments/assets/900afaea-3133-4992-97a1-b9da57963f36" />

<img width="770" height="470" alt="image" src="https://github.com/user-attachments/assets/1ed3b7f8-8769-43eb-b829-146df5207b9f" />



- Storage accesses privately via VM.
<img width="772" height="376" alt="image" src="https://github.com/user-attachments/assets/3b8cdd64-f9e1-4e72-9613-89cdb20fd690" />

<img width="959" height="357" alt="image" src="https://github.com/user-attachments/assets/6c3b3196-016c-4b98-b2e4-86acb72e27a0" />



- DNS Resolution Verified

   <img width="803" height="380" alt="image" src="https://github.com/user-attachments/assets/90289f1d-99b1-411f-b425-3303273f8e0b" />



- Public access Blocked Sucessfully.
 Storage service from my browser:
  
  <img width="901" height="455" alt="image" src="https://github.com/user-attachments/assets/f993231b-4687-4690-9708-c9d31d49e33f" />
<br>

# Screenshots

Screenshots available in /Screenshots directory.
- Vnet Configuration
- NSG Rules
- Bastion Connection
- Firewall Setup
- Load Balancer
- Private Endpoint + Storage Service
  
# Tools Used 

- Azure CLI
- Visual Studio Code
- Azure Portal
- draw.io

# Skills Demonstrated
- Azure Networking (Creation of Vnets, Subnets and Peering)
- Cloud Security (NSG, Firewall, Private Endpoint)
- Azure Bastion connection
- Load Balancing and High Availability
- DNS & Private Networking
- Troubleshooting (Routing and Connectivity)

# Future Enhancements
- Can conncet Load balancer with Firewall
- Use other Azure Storage Group IDs like file, Queue, and Table as of requirement to the network.
- Application Gateway with WAF
- CI/CD pipeline Integration
- Terraform (Iac)
- Monitoring using Azure Monitor

# Conclusion

This Project showcases a practical Azure architecture that emphasizes security, scalability, and private connectivity, in accordance with enterprise cloud standards.
