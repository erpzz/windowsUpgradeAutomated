# From: Eric Paiz, IT Support Specialist
# Purpose: In-place upgrade from Windows 11 Home to Windows 11 Pro for ~50 laptops.
# This is part 1 of 2 scripts. This script will mount the Windows 11 Pro ISO, start the upgrade, and log the process.
# The second script will activate Windows 11 Pro using a volume license key after the upgrade.

# Prompt the user for the path to the ISO file
# Ensure the ISO is available on each device
$isoPath = Read-Host "Please enter the path to the Windows 11 Pro ISO file"  

# Log file path
$logFilePath = "C:\UpgradeLogs\inPlaceUpgrade.log"

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
    # Mount the ISO
    Log-Message "Mounting the ISO from $isoPath"
    $mountResult = Mount-DiskImage -ImagePath $isoPath -PassThru
    $driveLetter = ($mountResult | Get-Volume).DriveLetter
    Log-Message "ISO mounted to drive $driveLetter"

    # Verify drive letter assignment
    if ($driveLetter) {
        Log-Message "Drive letter assigned: $driveLetter"
    } else {
        Log-Message "Drive letter assignment failed"
        throw "Drive letter assignment failed"
    }

    # Construct and verify setup path
    $setupPath = "$($driveLetter):\setup.exe"
    Log-Message "Constructed setup path: $setupPath"

    if (Test-Path $setupPath) {
        Log-Message "Setup path found: $setupPath"
        $process = Start-Process -FilePath $setupPath -ArgumentList "/auto upgrade /dynamicupdate disable" -Wait -PassThru
        Log-Message "In-place upgrade process started with ID $($process.Id)"
    } else {
        Log-Message "Setup path not found: $setupPath"
        throw "Setup path not found: $setupPath"
    }

    # Unmount the ISO after the upgrade
    Log-Message "Unmounting the ISO"
    Dismount-DiskImage -ImagePath $isoPath
    Log-Message "ISO unmounted"

    # Restart the computer to complete the upgrade
    Log-Message "Restarting the computer to complete the upgrade"
    Restart-Computer -Force

} catch {
    Log-Message "An error occurred: $_"
}
