# PowerShell Profile Script

# Path to your local Git repository
$repoPath = "gh repo clone Commtel-Ltd/ITPowerShellProfile"

# Navigate to the repository
Set-Location -Path $repoPath

# Fetch the latest changes from the remote repository
git fetch origin

# Get the current branch name
$currentBranch = git rev-parse --abbrev-ref HEAD

# Check for new commits on the remote repository
$localCommit = git rev-parse $currentBranch
$remoteCommit = git rev-parse origin/$currentBranch

if ($localCommit -ne $remoteCommit) {
    Write-Host "New commits detected. Pulling the latest changes..."
    git pull origin $currentBranch
} else {
    Write-Host "No new commits. Your repository is up to date."
}

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
