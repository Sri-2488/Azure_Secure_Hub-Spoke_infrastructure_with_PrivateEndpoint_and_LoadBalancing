# Private Endpoint and Storage Service
Private Endpoint is used in this project to access azure storage service privately without public internet. It is a fully private communication between Vms and Storage service.
Architecture:
VM ------> Private Endpoint ( Private DNS Zone) ---> Storage Service.

## Implementation Steps
- Need to create a storage account and container first.
- Then, need to craete a private endpoint and private DNS Zone
- Need to link DNS to Vnet and DNS has connect to Private Endpoint
- Vnet Peering is important here in between Spoke1_vnet and Spoke2_vnet
- Can test from VM to get private IP of private endpoint with this command
        " nslookup <storagename>.blob.core.windows.net> "
- Can be able to open the uploaded files in storage from Vm through browser using SAS token for temporary private access.

## Functionality
- Maps public service URL to private IP
- Ensures traffic stays within Azure network

## DNS Configuration
- Private DNS Zone:
          privatelink.blob.core.windows.net
- have used blob group-id here in the project for the object storage and simple architecture.

## Security Benifit
  - No Public Exposure
  - Access restricted to internal network only

## Key Learning
Priavte Endpoint improves:
- Security
- Network Isolation
- Compliance
