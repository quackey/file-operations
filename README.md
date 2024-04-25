# FILE OPERATIONS


## Google Drive Mass File Uploader

### Requirements

1. Rclone installed, configured, google drive mounted as gdrive
   
   `sudo -v ; curl https://rclone.org/install.sh | sudo bash`
   
   `rclone configure`
   
   `rclone mount gdrive: /path/to/mount/with/write/permissions`
   
2. Change to the desired path in code for source and destination lists
   
3. Format your lists:
   
   -list_src.txt:
   
   `/mnt/src/yourfilehere.ext`
   
   `/mnt/src/yourotherfile.ext`
   
   -list_dest.txt:
   
   `gdrive:/path/to/the/folder/in/google/drive/`
   
   Destination doesn't need filenames.
   
###Run

`git clone https://github.com/quackey/file-operations`

`cd file-operations`

`sudo chmod 775 mass _file_uploader_google_drive.sh`

`./mass _file_uploader_google_drive.sh`
   
