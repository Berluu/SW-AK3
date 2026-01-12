	
	# Name of DHCP server
$DhcpServer = "berelv-DC-AD-01"
	# Save .csv file to this location:
$OutputFile = "C:\Users\berelv\AK3\DHCP_Lease.csv"

	# Get the scopes on the DHCP server
$scopes = Get-DhcpServerv4Scope -ComputerName $DhcpServer

	# Look through the scope(s)
foreach ($scope in $scopes) {
	#  Get all leases in scope, select headers to save, and export a .csv file to the location chosen earlier
	Get-DhcpServerv4Lease -ComputerName $DhcpServer -ScopeId $scope.ScopeId -AllLeases | Select-Object ScopeId, IPAddress, HostName, CLientID, AddressState | Export-csv -Path $OutputFile -Delimiter ";" -NoTypeInformation
}

Write-Output "Lease information saved to $OutputFile"