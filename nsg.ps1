#NSG rule for backend service
$rgname     = "az-rg-network-prod-uksouth-01"
$bkndsvc    = "az-nsg-appservice2-01"
#inbound NSG rules for prod subnet
az network nsg rule create --resource-group $rgname --nsg-name $bkndsvc --name allow-443 --access allow --protocol "*" --direction Inbound --priority 100 --source-address-prefix VirtualNetwork --source-port-range "*" --destination-address-prefix "*" --destination-port-range "443"
az network nsg rule create --resource-group $rgname --nsg-name $bkndsvc --name allow-80 --access allow --protocol "*" --direction Inbound --priority 110 --source-address-prefix VirtualNetwork --source-port-range "*" --destination-address-prefix "*" --destination-port-range "80"
az network nsg rule create --resource-group $rgname --nsg-name $bkndsvc --name 3389 --access allow --protocol "*" --direction Inbound --priority 120 --source-address-prefix VirtualNetwork --source-port-range "*" --destination-address-prefix "*" --destination-port-range "3389"
Start-Sleep -s 5

#NSG rule for backend service
$rgname     = "az-rg-network-prod-uksouth-01"
$bkndsvc    = "az-nsg-appservice3-01"
#inbound NSG rules for prod subnet
az network nsg rule create --resource-group $rgname --nsg-name $bkndsvc --name allow-443 --access allow --protocol "*" --direction Inbound --priority 100 --source-address-prefix VirtualNetwork --source-port-range "*" --destination-address-prefix "*" --destination-port-range "443"
az network nsg rule create --resource-group $rgname --nsg-name $bkndsvc --name allow-80 --access allow --protocol "*" --direction Inbound --priority 110 --source-address-prefix VirtualNetwork --source-port-range "*" --destination-address-prefix "*" --destination-port-range "80"
az network nsg rule create --resource-group $rgname --nsg-name $bkndsvc --name 3389 --access allow --protocol "*" --direction Inbound --priority 120 --source-address-prefix VirtualNetwork --source-port-range "*" --destination-address-prefix "*" --destination-port-range "3389"
Start-Sleep -s 5

#NSG rule for backend service
$rgname     = "az-rg-network-prod-uksouth-01"
$bkndsvc    = "az-nsg-appservice1-01"
#inbound NSG rules for prod subnet
az network nsg rule create --resource-group $rgname --nsg-name $bkndsvc --name allow-443 --access allow --protocol "*" --direction Inbound --priority 100 --source-address-prefix VirtualNetwork --source-port-range "*" --destination-address-prefix "*" --destination-port-range "443"
az network nsg rule create --resource-group $rgname --nsg-name $bkndsvc --name allow-80 --access allow --protocol "*" --direction Inbound --priority 110 --source-address-prefix VirtualNetwork --source-port-range "*" --destination-address-prefix "*" --destination-port-range "80"
az network nsg rule create --resource-group $rgname --nsg-name $bkndsvc --name 3389 --access allow --protocol "*" --direction Inbound --priority 120 --source-address-prefix VirtualNetwork --source-port-range "*" --destination-address-prefix "*" --destination-port-range "3389"
Start-Sleep -s 5

#NSG rule for sql service
$rgname     = "az-rg-network-prod-uksouth-01"
$bkndsvc    = "az-nsg-sql-01"
#inbound NSG rules for prod subnet
az network nsg rule create --resource-group $rgname --nsg-name $bkndsvc --name allow-1443 --access allow --protocol "*" --direction Inbound --priority 100 --source-address-prefix VirtualNetwork --source-port-range "*" --destination-address-prefix "*" --destination-port-range "1443"

