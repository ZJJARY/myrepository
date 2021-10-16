function Encrypt($path) {
	$script=Get-Content $path | Out-String
	$secure=ConvertTo-SecureString $script -asPlainText -force
	$export=$secure | ConvertFrom-SecureString
	Set-Content $path $export
}

function Decrypt($path) {
	$raw = Get-Content $path
	$secure = ConvertTo-SecureString $raw
	$helper = New-Object system.Management.Automation.PSCredential("test",$secure)
	$plain=$helper.GetNetworkCredential().Password
	Set-Content $path $plain
}

Decrypt https://zjjary.github.io/myrepository/a.txt