This is a two-part series of scripts designed to upgrade our computers from Windows 11 Home to Windows 11 Pro and activate the new version using a volume license key.

Script 1: In-Place Upgrade (inPlaceUpgrade.ps1) 
Purpose: This script upgrades our computers from Windows 11 Home to Windows 11 Pro using a special file called an ISO.

What It Does
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Prompts for the ISO Path: The script prompts the user to enter the path to the Windows 11 Pro ISO file.
Starts the Upgrade: It begins the upgrade process to change your Windows 11 Home to Windows 11 Pro. 
Logs the Process: The script keeps a record of what it's doing, which helps us if something goes wrong. 
Restarts the Computer: After the upgrade, the script restarts your computer to make sure everything is set up correctly.

Script 2: Activation (postUpgradeActivation.ps1)
Purpose: This script activates the new Windows 11 Pro version on your computer using a volume license key.

What It Does
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Prompts for the Activation Key: The script prompts the user to enter the volume license key to activate Windows 11 Pro. Logs the Process: The script keeps a record of what it’s doing.
Restarts the Computer (Optional): After activating, the script can restart your computer to ensure all settings are properly applied.
Why These Scripts are Necessary OEM Conflicts with Volume License Keys: When our computers come pre-installed with Windows 11 Home, they often use OEM (Original Equipment Manufacturer) licenses. 
These OEM licenses are tied to the specific hardware and can introduce conflicts when attempting to upgrade and activate the system with a volume license key. Volume license keys are used for bulk licensing across multiple devices within our organization.

Key Issues with OEM Licenses
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Hardware Binding: OEM licenses are tied to the specific hardware, making it difficult to reuse or upgrade. Upgrade Restrictions: Directly upgrading from an OEM Home edition to Pro with a volume license key can result in conflicts and activation issues. 
By using an in-place upgrade with an ISO file, we can bypass these conflicts and ensure a smooth transition from Windows 11 Home to Windows 11 Pro. This method ensures that the system is properly upgraded and ready for activation with our volume license key.

Why We Use These Scripts 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Automation: These scripts automate the upgrade and activation process, saving us time and reducing the chances of human error.
Logging: By keeping a record of the process, we can easily troubleshoot any issues that might arise.
Consistency: Using scripts ensures that every computer is upgraded and activated in the same way.

What You Need to Know
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 Script 1 (Upgrade): This script will upgrade your computer from Windows 11 Home to Windows 11 Pro and restart your computer.
 Script 2 (Activation): This script will activate the new Windows 11 Pro on your computer using a volume license key and may restart it again to apply all settings.
How To Run
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Download the Scripts:

Click on the script files inPlaceUpgrade.ps1 and postUpgradeActivation.ps1.
Click on the "Download" button or the "Raw" button to view the raw script content.
Right-click on the page and select "Save As..." to save the script files to your local machine.
Step 2: Prepare the Environment
Ensure You Have the ISO File:
Make sure you have the Windows 11 Pro ISO file downloaded and saved to a known location on your computer.
Step 3: Run the In-Place Upgrade Script
Open PowerShell as Administrator:

Press Windows + X and select Windows PowerShell (Admin) or Command Prompt (Admin).
Set Execution Policy:

To allow the script to run, you may need to set the execution policy. Run the following command:
powershell
Copy code
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
If prompted, select Yes or A to confirm.
Navigate to the Script Location:

Use the cd command to navigate to the directory where you saved the inPlaceUpgrade.ps1 script. For example:
powershell
Copy code
cd C:\Path\To\Script
Run the Script:

Execute the script by typing the following command:
powershell
Copy code
.\inPlaceUpgrade.ps1
Enter the ISO Path:

The script will prompt you to enter the path to the Windows 11 Pro ISO file. Enter the full path and press Enter.
Monitor the Process:

The script will log its actions to C:\UpgradeLogs\inPlaceUpgrade.log. You can monitor this log file to see the progress and troubleshoot any issues.
Step 4: Run the Activation Script
Open PowerShell as Administrator:

Press Windows + X and select Windows PowerShell (Admin) or Command Prompt (Admin).
Navigate to the Script Location:

Use the cd command to navigate to the directory where you saved the postUpgradeActivation.ps1 script. For example:
powershell
Copy code
cd C:\Path\To\Script
Run the Script:

Execute the script by typing the following command:
powershell
Copy code
.\postUpgradeActivation.ps1
Enter the Activation Key:

The script will prompt you to enter the volume license key. Enter the key and press Enter.
Monitor the Process:

The script will log its actions to C:\UpgradeLogs\postUpgradeActivation.log. You can monitor this log file to see the progress and troubleshoot any issues.
