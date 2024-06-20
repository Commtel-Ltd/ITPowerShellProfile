# IT PowerShell Profile

This PowerShell profile script contains a number of useful IT functions with simple aliases set up for quick access. Additionally, it includes a method to check for new commits in a specified Git repository and pull them if there are any updates.

## Features

- **Automatic Git Update**: Checks for new commits in the specified Git repository and pulls them if there are any.
- **System Maintenance Functions**: Includes various system maintenance functions like DISM, SFC, IP reset, DNS flush, Winsock reset, and more.

| Alias          | Function Name          | Description                              |
|----------------|------------------------|------------------------------------------|
| `dismfix`      | `Invoke-DISM`          | Runs the DISM tool to restore system health. |
| `sfcfix`       | `Invoke-SFC`           | Runs the SFC tool to scan and fix system files. |
| `ipreset`      | `Reset-IP`             | Resets the IP stack.                     |
| `iprelease`    | `Release-IP`           | Releases the IP address.                 |
| `iprenew`      | `Renew-IP`             | Renews the IP address.                   |
| `dnsflush`     | `Flush-DNS`            | Flushes the DNS cache.                   |
| `winsockreset` | `Reset-Winsock`        | Resets Winsock.                          |
| `restartnow`   | `Restart-ComputerNow`  | Restarts the computer immediately.       |
| `chkdskfix`    | `Invoke-CHKDSK`        | Runs CHKDSK with /f and /r flags.        |
