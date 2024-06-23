# Delete old backup

This script is designed to help manage and clean up old backup files from Google Drive. It deletes `.json`, `.tar`, and `.sql.gz` files that are older than one month from the date of the newest file in the specified backup directory.

## Prerequisites

- [rclone](https://rclone.org/) installed and configured with Google Drive.
- Bash shell.

## Installation

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

