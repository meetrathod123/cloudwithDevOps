# Static values based on your previous setup
$resourceGroup = "1-7609461d-playground-sandbox"   # Same resource group as before
$location = "southcentralus"                       # Same location
$publicIpName = "MyPublicIP2"                      # Same Public IP as before
$vnetName = "MyVNet"                               # Existing Virtual Network
$subnetName = "MySubnet"                           # Existing Subnet
$nsgName = "MyNSG"                                 # Existing Network Security Group

# Prompt for new VM Name
$vmName = Read-Host "Enter the VM Name (e.g. MyLinuxVM)"

# Get the credential for the VM admin user
$credential = Get-Credential -UserName "cloudadmin" -Message "Enter the password for the VM admin user"

# Create a new VM with the provided information
New-AzVM -ResourceGroupName $resourceGroup `
  -Name $vmName `
  -Location $location `
  -VirtualNetworkName $vnetName `
  -SubnetName $subnetName `
  -SecurityGroupName $nsgName `
  -PublicIpAddressName $publicIpName `
  -OpenPorts 22,80 `
  -Credential $credential `
  -Size "Standard_D2s_v3"

Write-Host "VM '$vmName' created successfully!"

