# PowerShell Profile Script

# Define the path to the custom directory for storing the profile script and readme
$customPath = Join-Path $env:USERPROFILE "Documents\PowerShell"

# Define the local git repository path
$repoPath = Join-Path $customPath "ITPowerShellProfile"  # Replace 'YourRepoName' with the actual repo name

# Function to check for updates using Git
function Check-ForUpdates {
    if (-not (Test-Path $repoPath)) {
        Write-Output "Local repository not found. Cloning repository..."
        git clone https://github.com/Commtel-Ltd/ITPowerShellProfile.git $repoPath
    } else {
        Write-Output "Checking for updates in the repository..."
        Set-Location -Path $repoPath
        git fetch origin
        $localCommit = git rev-parse HEAD
        $remoteCommit = git rev-parse origin/main  # Assuming the main branch is used
        if ($localCommit -ne $remoteCommit) {
            Write-Output "Updates found. Pulling the latest changes..."
            git pull origin main
            Write-Output "Profile script updated. Please restart PowerShell to apply changes."
        } else {
            Write-Output "Profile script is up-to-date."
        }
    }
}

# Run the update check function when PowerShell starts
Check-ForUpdates

# Navigate back to the original directory
Set-Location -Path $HOME

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
