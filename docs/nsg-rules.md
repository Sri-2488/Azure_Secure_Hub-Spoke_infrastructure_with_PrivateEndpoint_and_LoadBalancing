# Network Security Group (NSG) Rules
NSG was implemented to control both inbound and outbound traffic at subnet level in the network.

## Rules Implemented in the Network
### 1. Denied All Inbound 
- Priority: 4096
- Action: Deny
### 2. Allowed RDP (3389) to connect VMs via bastion from the specific system
- Priority: 100
- Source: My Public IP
- Protocol: TCP
- Action: Allow
### 3. Allowed HTTP (80) to connect to Internet via Azure Load Balancer
- Priority: 150
- Source: Internet
- Destination Prt: 80
- Protocol: TCP
- Action: Allow
### 4. Allow Azure Load Balancer for health probes.
- Prority: 140
- Source: AzureLoadBalancer
- Destination Port: 80
- Action: Allow
  
Learned from NSG:
- Priority ---> Lower number = higher priority.
- We can't do like this ALlow(200) and Deny(100), the traffic may gonna block. Have to allow lowe number first and then higher number.
- NSG should connect to the subnets in this network to get desired output.
