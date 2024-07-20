# Backup and File Management - Bash Script

This repository contains a comprehensive Bash script that provides functionalities for backing up files, managing files and folders, and performing compression and decompression operations. The script is designed to be user-friendly and includes various options to manage files efficiently.

## Features

1. *Backup Files and Folders*:
   - Uses rsync to copy files from the /home directory.
   - Compresses the backup folder into a .zip file.
   - Automatically manages backup folder creation and deletion.

2. *File Management*:
   - Create files and folders.
   - Copy, rename, and delete files and folders.
   - Generate multiple files with specified content.

3. *Compression and Decompression*:
   - Compress files using gzip.
   - Decompress files compressed with gzip.
   - Compress folders using zip.
   - Decompress folders compressed with zip.

## Usage



To run the backup function:
bash
./project.sh

Follow the on-screen instructions to navigate through the menu.

### File Management:
The file management menu provides options to create, copy, rename, delete, and generate multiple files. Simply select the desired option and follow the prompts.

### Compression and Decompression:
This menu allows you to compress and decompress files and folders using gzip and zip. Choose the appropriate option and specify the file or folder to be processed.
Scheduling with Crontab

### Backup Function:
To schedule the script to run at a specific time using crontab:

bash

crontab -e

Add the following line to run the script at 2:00 AM daily:

bash

0 2 * * * /path/to/project.sh

License

This project is licensed under the MIT License - see the LICENSE file for details.
Contributions

Contributions are welcome! Please fork the repository and submit a pull request with your improvements.
Contact

If you have any questions or suggestions, feel free to open an issue or contact me directly.

Thank you for using this script!


