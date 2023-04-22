# Requires -RunAsAdministrator

# Define the ICMP rules
$inboundRuleName = "Allow_ICMP_Inbound_for_Traceroute"
$outboundRuleName = "Allow_ICMP_Outbound_for_Traceroute"

# Check if the rules already exist
$existingInboundRule = Get-NetFirewallRule -DisplayName $inboundRuleName -ErrorAction SilentlyContinue
$existingOutboundRule = Get-NetFirewallRule -DisplayName $outboundRuleName -ErrorAction SilentlyContinue

# Define ICMP types and codes for inbound and outbound rules
$icmpInboundRules = @("11:0", "0:0") + (0..15 | ForEach-Object { "3:$_" })
$icmpOutboundRules = @("8:0")

# Create the inbound rules if they don't exist
if (-not $existingInboundRule) {
    foreach ($icmpRule in $icmpInboundRules) {
        New-NetFirewallRule -DisplayName $inboundRuleName -Direction Inbound -Protocol ICMPv4 -IcmpType $icmpRule -Action Allow -Enabled True
    }
    Write-Host "Inbound ICMP rules created successfully."
} else {
    Write-Host "Inbound ICMP rules already exist."
}

# Create the outbound rules if they don't exist
if (-not $existingOutboundRule) {
    foreach ($icmpRule in $icmpOutboundRules) {
        New-NetFirewallRule -DisplayName $outboundRuleName -Direction Outbound -Protocol ICMPv4 -IcmpType $icmpRule -Action Allow -Enabled True
    }
    Write-Host "Outbound ICMP rules created successfully."
} else {
    Write-Host "Outbound ICMP rules already exist."
}
