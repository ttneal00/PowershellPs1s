$RGname="tfsCompute"
$extip = curl ipv4.icanhazip.com
#$rulename="allowAppPort$port"
$nsgname="ADOCentral-nsg"

# Get the NSG resource
$nsg = Get-AzNetworkSecurityGroup -Name $nsgname -ResourceGroupName $RGname

$nsg | Add-AzNetworkSecurityRuleConfig -Name ADO-ID -Description "Azure DevOps Services Identity Service" -Access Allow -Protocol TCP -Direction Inbound -Priority 500 -SourceAddressPrefix $extip -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 3389

$nsg | Add-AzNetworkSecurityRuleConfig -Name ADO-ID -Description "Azure DevOps Services Identity Service" -Access Allow -Protocol TCP -Direction Inbound -Priority 1500 -SourceAddressPrefix "168.62.105.45", "40.81.42.115" -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 1433

$nsg | Add-AzNetworkSecurityRuleConfig -Name RIS-CUS -Description "Regional Identity Service - Central United States" -Access Allow -Protocol TCP -Direction Inbound -Priority 1600 -SourceAddressPrefix "13.89.236.72", "52.165.41.252", "52.173.25.16", "13.86.38.60", "20.45.1.175", "13.86.36.181", "52.154.53.1", "52.158.209.56", "20.37.138.122", "20.37.158.0/23", "20.37.139.247" -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 1433

$nsg | Add-AzNetworkSecurityRuleConfig -Name DMT-CUS -Description "Data migration tool - Central United States" -Access Allow -Protocol TCP -Direction Inbound -Priority 1700 -SourceAddressPrefix "52.173.74.9", "52.165.184.188", "20.45.1.234", "13.86.39.123" -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 1433

$nsg | Add-AzNetworkSecurityRuleConfig -Name ADO-CUS -Description "Azure DevOps Services - Central United States" -Access Allow -Protocol TCP -Direction Inbound -Priority 1800 -SourceAddressPrefix "13.89.236.72", "52.165.41.252", "52.173.25.16", "13.86.38.60", "20.45.1.175", "13.86.36.181", "52.158.209.56" -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 1433

$nsg | Add-AzNetworkSecurityRuleConfig -Name ResServ-CUS -Description "Releases service - United States" -Access Allow -Protocol TCP -Direction Inbound -Priority 1825 -SourceAddressPrefix "23.102.153.83", "23.101.127.247", "23.100.85.250", "13.86.39.233", "40.80.217.53", "52.232.229.122" -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 1433

$nsg | Add-AzNetworkSecurityRuleConfig -Name Artifacts-CUS -Description "Azure Artifacts - United States" -Access Allow -Protocol TCP -Direction Inbound -Priority 1850 -SourceAddressPrefix "52.173.148.93", "104.43.253.181", "23.99.179.148", "40.80.222.154", "40.119.0.130", "40.119.0.139", "13.86.125.169", "20.41.44.47", "40.90.219.165" -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 1433

$nsg | Add-AzNetworkSecurityRuleConfig -Name Artifactsfd-CUS -Description "Azure Artifacts Feed - United States" -Access Allow -Protocol TCP -Direction Inbound -Priority 1875 -SourceAddressPrefix "52.173.251.89", "20.45.1.3", "40.67.190.224", "20.41.58.125", "40.119.1.14", "20.45.1.249" -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 1433

$nsg | Add-AzNetworkSecurityRuleConfig -Name Artifactsblob-CUS -Description "Azure Artifacts Blob - United States" -Access Allow -Protocol TCP -Direction Inbound -Priority 1900 -SourceAddressPrefix "70.37.94.103", "40.78.129.25", "40.67.155.236", "52.230.216.163", "20.45.3.51" -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 1433

$nsg | Add-AzNetworkSecurityRuleConfig -Name TestPlans-CUS -Description "Test Plans - United States" -Access Allow -Protocol TCP -Direction Inbound -Priority 1925 -SourceAddressPrefix "52.253.227.131","40.91.89.233", "20.41.47.199", "40.91.117.40", "40.91.126.113", "20.37.141.154" -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 1433

$nsg | Add-AzNetworkSecurityRuleConfig -Name AnalyticsServic-CUS -Description "Analytics service - United States" -Access Allow -Protocol TCP -Direction Inbound -Priority 1950 -SourceAddressPrefix "20.41.43.22", "20.36.236.83", "20.41.40.50", "52.143.251.221", "52.242.212.199", "13.86.33.148", "13.86.39.80" -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 1433

$nsg | Set-AzNetworkSecurityGroup