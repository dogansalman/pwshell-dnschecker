$ErrorActionPreference= 'silentlycontinue'
[String[]] $servers = "google.com","alexa.com"
foreach ($Server in $Servers)
{
    $Addresses = $null
	$DnsResults = $null
	$Addresses = Resolve-DnsName -Name $Server -Type NS
	If($Addresses) {
		foreach($Address in $addresses) {
			$section = $Address.Section
			If($section -eq "Answer") { $DnsResults +=  $Address.NameHost + " "}
		}
	} else {
		$DnsResults = "No dns record"
	}
    Write-Host $Server -foreground "White"
    Write-Host $DnsResults -foreground "Red"

}
Write-Host "-----------------------------------------------------"
Write-Host "DNS Results Received" -foreground "Green"

Pause