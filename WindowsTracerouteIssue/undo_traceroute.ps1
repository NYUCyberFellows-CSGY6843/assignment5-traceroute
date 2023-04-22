# Requires -RunAsAdministrator

# Define the ICMP rules
$inboundRuleName = "Allow_ICMP_Inbound_for_Traceroute"
$outboundRuleName = "Allow_ICMP_Outbound_for_Traceroute"

# Find existing firewall rules
$existingInboundRules = Get-NetFirewallRule -DisplayName $inboundRuleName -ErrorAction SilentlyContinue
$existingOutboundRules = Get-NetFirewallRule -DisplayName $outboundRuleName -ErrorAction SilentlyContinue

# Remove inbound rules if they exist
if ($existingInboundRules) {
    $existingInboundRules | Remove-NetFirewallRule
    Write-Host "Inbound ICMP rules removed successfully."
} else {
    Write-Host "Inbound ICMP rules not found."
}

# Remove outbound rules if they exist
if ($existingOutboundRules) {
    $existingOutboundRules | Remove-NetFirewallRule
    Write-Host "Outbound ICMP rules removed successfully."
} else {
    Write-Host "Outbound ICMP rules not found."
}
