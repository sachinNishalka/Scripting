# Scripting

Task Automation

## deploy-web.sh

This repository contains a Bash script for deploying a web template onto a server. The script automates the process of installing required packages, setting up a web service, downloading a web template, and deploying it to the web server's directory.

### Prerequisites

Before using this script, ensure that you have the following prerequisites in place:

1. **Linux Environment**: The script is designed to run on a Linux system, specifically one that uses the `yum` package manager (e.g., CentOS, Fedora).

2. **Root or Sudo Access**: The script requires administrative privileges for package installation and service management.

### Usage

**Clone the Repository**: Begin by cloning this repository to your desired location:

```bash
git clone https://github.com/your-username/your-repo.git
cd your-repo
```

1. Configure Variables: Open the deploy_template.sh script in a text editor and update the following variables:

   - PACKAGES: List of packages to be installed (space-separated).
   - SERVICE: Name of the web service to start and enable.
   - URL: URL of the web template zip file to download.
   - ARTIFACT: Name of the extracted folder from the zip file.
   - TEMPDIR: Temporary directory where web files will be downloaded and extracted.

2. Run the Script: Make the script executable and then run it using the following commands:

```bash
chmod +x deploy_template.sh
./deploy_template.sh
```

The script will execute the deployment steps, including package installation, web service setup, and web template deployment.

3. Access the Web Template: Once the script has completed successfully, you should be able to access the deployed web template through a web browser using the server's IP address or domain name.

### Important Notes

- This script assumes that you are using a Linux distribution with the yum package manager. If your distribution uses a different package manager (e.g., apt for Debian-based systems), you will need to modify the package installation commands accordingly.
- Make sure to have backups of any existing data in the web server's directory (/var/www/html/) before running the script, as the script copies and overwrites files in this directory.
- If you encounter any errors during script execution, refer to the error messages for troubleshooting. Common issues might include network connectivity problems, incorrect URLs, or package names.

## server-monitor.sh

This Bash script is designed to check whether the Apache HTTP Server (HTTPD) process is running or not. If the process is not running, the script will attempt to start it using the systemctl command.

### Prerequisites

Before using this script, ensure that you have the following:

- A Linux system with the Apache HTTP Server (httpd) installed.
- Sufficient permissions to execute the script and manage system services.

### Usage

1. Open a terminal on your Linux system.
2. Navigate to the directory containing the script using the cd command.
3. Make the script executable with the following command:

```bash
chmod +x script_name.sh
```

Replace script_name.sh with the actual name of the script.

4. Run the script using the following command:

```bash
./script_name.sh
```

Replace script_name.sh with the actual name of the script.

### Script Explanation

1. Displays the current date using the date command.
2. Checks if the file /var/run/httpd/httpd.pid exists. This file typically contains the process ID (PID) of the running HTTPD process. The &> /dev/null part redirects any output (both standard output and error) to the null device, effectively suppressing any messages

3. If the file /var/run/httpd/httpd.pid exists, the script assumes that the HTTPD process is running and displays the message: "HTTPD process is running."

4. If the file does not exist, the script proceeds to the else block and displays the following messages:

   - "HTTPD process is not running"
   - "Starting the process"

5. The script then attempts to start the HTTPD process using the systemctl start httpd command.

6. After attempting to start the process, the script checks the exit code ($?) of the systemctl command.

   - If the exit code is 0, it means that the process started successfully, and the script displays: "Process started successfully."
   - If the exit code is non-zero, it means that the process starting failed, and the script displays: "Process starting failed."
