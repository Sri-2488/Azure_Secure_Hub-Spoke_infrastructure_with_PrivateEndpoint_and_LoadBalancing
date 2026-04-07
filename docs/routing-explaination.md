# Routing and UDR
User Defined Routes (UDR) were used to controll otbound traffic flow centrally through a Azure Firewall instead of allowing direct Internet Access.

## Implementation
- Created the Public IP first.
- Created a Azure firewall and attached public IP to the firewall.
- Need to get the private IP of firewall and save that in a variable.
- Then, Created a Route table and route, need to add next hop type as VirtualAppliance and private IP address of firewall(to force the traffic to the firewall).
- Then., associated the route table to the Spoke1_vnet.
- Have to Create a Firewall network rule to allow HTTP (80) and HTTPS (443) traffic to connect to Interent from VMs.

## Have done in this Part:
- All traffic from vms were sent to the firewall.
- Central Control of traffic
- Can block/allow anything in the network.

## Issues Raised while doing Azure Firewall and Load Balancer:
- Without Firewall rule, Vm couldn't be able to connect to the Interent.
- Assymetric Routing after added the Azure Load Balancer, because the requested traffic is from Load Balancer to VM but the response is from VM to firewall to Internet. Thats why, to get the desired output for Load Balancer, had adjusted the UDR only for the Azure Load balancer output.
