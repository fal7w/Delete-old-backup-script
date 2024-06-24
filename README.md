# Delete old backup

This script is designed to help manage and clean up old backup files from Google Drive. It deletes `.json`, `.tar`, and `.sql.gz` files that are older than one month from the date of the newest file in the specified backup directory.

## Prerequisites

- [rclone](https://rclone.org/) installed and configured with Google Drive.
- Bash shell.

## Installation
1. **Install rclone:**
    ```bash
    sudo apt update
    sudo apt install rclone

1. **Install rclone:**
    ```bash
    rclone config

This command will start an interactive setup process. Here's a step-by-step guide to the configuration process:

- Create a new remote:
    - Choose n for a new remote.
- Name the remote:
    - Enter a name for your remote. This can be anything you like, for example, gdrive.
- Choose cloud storage:
    - Choose 13 for Google Drive (this number might change if the list updates, so look for "Google Drive").
- Client ID and Secret:
    - If you have your own client ID and secret, enter them here. If not, you can leave these blank and press enter to use rclone's default.
- Scope:
    - Choose the scope you want for rclone. Typically, you would select 1 for full access.
- Root Folder ID:
    - Leave this blank unless you want to use a specific folder.
- Service Account File:
    - Leave this blank unless you are using a service account.
- Edit advanced config:
    - Choose n for no.
- Use auto config:
    - Choose y for yes. This will open a browser window for you to authenticate with your Google account. If you are configuring on a remote or headless machine, follow the instructions provided to complete the authentication.
- Finish configuration:
    - Once authenticated, confirm the settings. You can then test the remote to ensure it's working.
- Using rclone with Google Drive:
    - List files and directories:
        ```bash
         rclone ls gdrive:

         Replace gdrive with the name of your remote.
         
## Clone

1. **Clone the repository:**
   ```bash
   git clone https://github.com/fal7w/Delete-old-backup-script.git
   cd Delete-old-backup-script

2. **Make the script executable:**
    ```bash
    chmod +x delete_old_backups.sh

## Usage
1. **Configure rclone::**
- Ensure that rclone is configured to access your Google Drive. You can follow the rclone configuration guide.

2. **Run the script::**
    ```bash
    ./delete_old_backups.sh

The script will:
- List all .json, .tar, and .sql.gz files in the specified backup directory .
- Identify the newest file and calculate a threshold date one month before the first day of the month of the newest files date.
- Delete files older than the threshold date.

