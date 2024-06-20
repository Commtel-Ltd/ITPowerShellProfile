# PowerShell Profile Script

# Function to check for updates from GitHub
function Check-ForUpdates {
    $repoOwner = "YourGitHubUsername"  # Replace with your GitHub username or organization
    $repoName = "YourRepoName"         # Replace with your repository name
    $scriptFile = "YourScriptName.ps1" # Replace with the name of your script file in the repository
    $localScriptPath = "$PROFILE"
    $apiUrl = "https://api.github.com/repos/$repoOwner/$repoName/contents/$scriptFile"

    try {
        $response = Invoke-RestMethod -Uri $apiUrl -UseBasicParsing
        $remoteContent = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($response.content))
        $localContent = Get-Content -Path $localScriptPath -Raw

        if ($remoteContent -ne $localContent) {
            Write-Output "A new version of the profile script is available. Updating..."
            $remoteContent | Set-Content -Path $localScriptPath
            Write-Output "Profile script updated. Please restart PowerShell to apply changes."
        } else {
            Write-Output "Profile script is up-to-date."
        }
    } catch {
        Write-Output "Failed to check for updates: $_"
    }
}

# Run the update check function when PowerShell starts
Check-ForUpdates

# Function to run DISM tool
function Invoke-DISM {
    dism.exe /online /cleanup-image /restorehealth
}
Set-Alias dismfix Invoke-DISM

# Function to run SFC tool
function Invoke-SFC {
    sfc /scannow
}
Set-Alias sfcfix Invoke-SFC

# Function to reset IP stack
function Reset-IP {
    netsh int ip reset
}
Set-Alias ipreset Reset-IP

# Function to release IP address
function Release-IP {
    ipconfig /release
}
Set-Alias iprelease Release-IP

# Function to renew IP address
function Renew-IP {
    ipconfig /renew
}
Set-Alias iprenew Renew-IP

# Function to flush DNS cache
function Flush-DNS {
    ipconfig /flushdns
}
Set-Alias dnsflush Flush-DNS

# Function to reset Winsock
function Reset-Winsock {
    netsh winsock reset
}
Set-Alias winsockreset Reset-Winsock

# Function to restart the computer
function Restart-ComputerNow {
    shutdown /r /t 0
}
Set-Alias restartnow Restart-ComputerNow

# Function to run CHKDSK with /f and /r flags
function Invoke-CHKDSK {
    chkdsk /f /r
}
Set-Alias chkdskfix Invoke-CHKDSK

# Function to display the readme file
function Show-Readme {
    $readmePath = "$HOME\it_tools_readme.txt"
    if (Test-Path $readmePath) {
        Get-Content $readmePath | Out-Host
    } else {
        Write-Output "Readme file not found."
    }
}
Set-Alias showreadme Show-Readme

# Create a readme file with instructions
$readmeContent = @"
IT Tools PowerShell Profile
============================

This PowerShell profile contains functions and aliases for various IT-related tasks.

Functions and their aliases:
1. Invoke-DISM (alias: dismfix) - Runs DISM to restore health.
2. Invoke-SFC (alias: sfcfix) - Runs SFC to scan and repair system files.
3. Reset-IP (alias: ipreset) - Resets the IP stack.
4. Release-IP (alias: iprelease) - Releases the current IP address.
5. Renew-IP (alias: iprenew) - Renews the IP address.
6. Flush-DNS (alias: dnsflush) - Flushes the DNS cache.
7. Reset-Winsock (alias: winsockreset) - Resets the Winsock catalog.
8. Restart-ComputerNow (alias: restartnow) - Restarts the computer immediately.
9. Invoke-CHKDSK (alias: chkdskfix) - Runs CHKDSK with /f and /r flags.
10. Show-Readme (alias: showreadme) - Displays this readme file.

Ensure this profile script is deployed on the target machines to make these functions available universally.
"@

# Save the readme file to the user's home directory
$readmePath = "$HOME\it_tools_readme.txt"
Set-Content -Path $readmePath -Value $readmeContent
