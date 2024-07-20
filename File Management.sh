#!/bin/bash

check_existence() {
    local item="$1"
    if [ ! -e "$item" ]; then
        echo "Error: $item does not exist."
        return 1
    fi
    return 0
}

backup() {
    SOURCE_DIR="/home"
    BACKUP_DIR="/backup/home_backup_$(date +%Y%m%d_%H%M%S)"

    sudo mkdir -p "$BACKUP_DIR"
    sudo rsync -a --progress "$SOURCE_DIR" "$BACKUP_DIR"
    sudo zip -r "${BACKUP_DIR}.zip" "$BACKUP_DIR"
    sudo rm -rf "$BACKUP_DIR"

    echo "Backup completed and compressed successfully."
    echo ""
}

file_management() {
    while true; do
        echo "File Management Menu:"
        echo "1. Create a file"
        echo "2. Copy a file"
        echo "3. Rename a file"
        echo "4. Delete a file"
        echo "5. Generate multiple files with data"
        echo "6. Exit to main menu"
        read -p "Enter your choice: " choice

        case $choice in
            1)
                read -p "Enter the file name to create: " filename
                touch "$filename"
                echo "File $filename created."
                echo ""
                ;;
            2)
                read -p "Enter the source file name: " src
                read -p "Enter the destination file name: " dest
                cp "$src" "$dest"
                echo "File copied from $src to $dest."
                echo ""
                ;;
            3)
  
                read -p "Enter the current file name: " oldname
                if check_existence "$oldname"; then
                
		        read -p "Enter the new file name: " newname
		        mv "$oldname" "$newname"
		        echo "File renamed from $oldname to $newname."
		fi
		echo ""
                ;;
            4)
                read -p "Enter the file name to delete: " filename
                if check_existence "$filename"; then
                
		        rm -f "$filename"
		        echo "File $filename deleted."
		fi
		echo ""
                ;;
            5)
                read -p "Enter the number of files to generate: " num_files
                read -p "Enter the base file name: " base_name
                read -p "Enter the content to write into the files: " content
                for ((i=1; i<=num_files; i++)); do
                    echo "$content" > "${base_name}_${i}.txt"
                done
                echo "$num_files files generated with the base name $base_name."
                echo ""
                ;;
            6)
                echo "Exiting to main menu."
                break
                echo ""
                ;;
            *)
                echo "Invalid choice. Please try again."
                ;;
        esac
    done
}

compression() {
    while true; do
        echo "Compression/Decompression Menu:"
        echo "1. Compress a file with gzip"
        echo "2. Decompress a file with gzip"
        echo "3. Compress a folder with zip"
        echo "4. Decompress a folder with zip"
        echo "5. Exit to main menu"
        read -p "Enter your choice: " choice

        case $choice in
            1)
                read -p "Enter the file name to compress: " filename
                if check_existence "$filename"; then
                
		        gzip "$filename"
		        echo "File $filename compressed with gzip."
		fi
		echo ""
                ;;
            2)
                read -p "Enter the gzip file name to decompress: " filename
                if check_existence "$filename"; then
		        gunzip "$filename"
		        echo "File $filename decompressed with gzip."
	        fi
                ;;
            3)
                read -p "Enter the folder name to compress: " foldername
                if check_existence "$foldername"; then
		        zip -r "${foldername}.zip" "$foldername"
		        echo "Folder $foldername compressed with zip."
		fi
                ;;
            4)
                read -p "Enter the zip file name to decompress: " filename
                if check_existence "$filename"; then
                
		        unzip "$filename"
		        echo "File $filename decompressed with zip."
	        fi
                ;;
            5)
                echo "Exiting to main menu."
                break
                ;;
            *)
                echo "Invalid choice. Please try again."
                ;;
        esac
    done
}

while true; do
    echo "Main Menu:"
    echo "1. Backup files"
    echo "2. File management"
    echo "3. Compression/Decompression"
    echo "4. Exit"
    read -p "Enter your choice: " main_choice

    case $main_choice in
        1)
            backup
            ;;
        2)
            file_management
            ;;
        3)
            compression
            ;;
        4)
            echo "Exiting."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done
