#!/bin/bash

# Define the backup directory on Google Drive
backup_dir="googleDrive4:/ExchangeCompany backup"

# List files with the desired extensions and sort by date
rclone lsl "$backup_dir" | grep -E '\.json$|\.tar$|\.sql.gz$' | sort -k2,3 > files.txt

# Get the date of the newest file
newest_date=$(tail -n 1 files.txt | awk '{print $2 " " $3}')

# Calculate the threshold date (first day of the month of the newest file's date minus one month)
threshold_date=$(date -d "$(date -d "$newest_date" '+%Y-%m-01') -1 month" '+%Y-%m-%d')

echo "Newest file date: $newest_date"
echo "Threshold date: $threshold_date"

# Delete files older than the threshold date
while read -r line; do
  file_date=$(echo "$line" | awk '{print $2 " " $3}')
  file_name=$(echo "$line" | awk '{for (i=4; i<=NF; i++) printf $i " "; print ""}' | sed 's/ *$//')
  file_date_formatted=$(date -d "$file_date" '+%Y-%m-%d')

  echo "Processing file: $file_name"
  echo "File date: $file_date_formatted"

  if [[ "$file_date_formatted" < "$threshold_date" ]]; then
    echo "Deleting: $backup_dir/$file_name"
    rclone delete "$backup_dir/$file_name"
  else
    echo "Skipping: $file_name"
  fi
done < files.txt

# Clean up
rm files.txt
