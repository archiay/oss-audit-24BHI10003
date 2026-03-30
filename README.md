# OSS Audit — Archi Israni | 24BHI10003

**Chosen Software:** Git  
**Course:** Open Source Software | VIT  
**Environment:** Ubuntu 24.04 LTS (WSL2 on Windows)

## About This Project
This project is a structured audit of Git — the open source distributed version
control system created by Linus Torvalds in 2005. The audit covers Git's origin
story, its GPL v2 license, ethical questions around open source software, how
Git lives on a Linux system, its ecosystem, and a comparison against its
proprietary alternative (Perforce Helix Core). Five shell scripts demonstrate
practical Linux command-line skills connected to the open source theme.

## Scripts
1. `script1_system_identity.sh` — Displays system info as a welcome screen (distro, kernel, user, uptime, license)
2. `script2_package_inspector.sh` — Checks if Git is installed, shows version details, prints a philosophy note
3. `script3_disk_auditor.sh` — Audits key directory sizes and permissions, checks Git config file
4. `script4_log_analyzer.sh` — Scans a log file for a keyword, counts matches, shows last 5 hits
5. `script5_manifesto.sh` — Interactively generates a personal open source manifesto and saves it to a file

## How to Run
```bash
# Make all scripts executable
chmod +x *.sh

# Script 1 — no arguments needed
./script1_system_identity.sh

# Script 2 — no arguments needed
./script2_package_inspector.sh

# Script 3 — no arguments needed
./script3_disk_auditor.sh

# Script 4 — pass a log file path and optional keyword (default: error)
./script4_log_analyzer.sh /var/log/syslog error

# Script 5 — interactive, no arguments needed
./script5_manifesto.sh
```

## Dependencies
All dependencies are pre-installed on Ubuntu 24.04:
- `bash` — shell interpreter
- `git` — the software being audited (install: `sudo apt install git -y`)
- `dpkg` / `apt-cache` — package inspection (built into Ubuntu)
- `lsb_release` — distro detection (built into Ubuntu)
- `coreutils` — provides `du`, `ls`, `date`, `whoami`, `uptime`
