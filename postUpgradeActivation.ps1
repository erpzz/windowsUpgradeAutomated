
# From: Eric Paiz, IT Support Specialist
# Purpose: Post-upgrade activation of Windows 11 Pro using a volume license key.
# This is part 2 of 2 scripts. This script will activate Windows 11 Pro after the in-place upgrade is complete.

# Use your volume license key to activate Windows 11 Pro
$volumeLicenseKey = Read-Host "Please enter the volume license key"

# Log file path
$logFilePath = "C:\UpgradeLogs\postUpgradeActivation.log"

# Create the log directory if it doesn't exist
New-Item -Path (Split-Path $logFilePath) -ItemType Directory -Force

# Function to log messages
function Log-Message {
    param (
        [string]$message
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Output "$timestamp - $message" | Tee-Object -FilePath $logFilePath -Append
}

try {
    # Apply the volume license key
    Log-Message "Applying volume license key"
    slmgr.vbs /ipk $volumeLicenseKey
    Log-Message "Volume license key applied"

    # Activate Windows
    Log-Message "Activating Windows"
    slmgr.vbs /ato
    Log-Message "Windows activated"
    # Optional: Restart the computer to ensure all settings are applied
    Log-Message "Restarting the computer to ensure all settings are applied"
    Start-Sleep -s 5
    Restart-Computer -Force

} catch {
    Log-Message "An error occurred: $_"
}
