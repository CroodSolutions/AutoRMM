#!/usr/bin/env python3
"""
This is an install script for Splashtop MSI, using Python 3.
For Splashtop there is no real advantage to using the MSI. It behaves exactly the same way as the EXE, so only making this script in one language. 
The script needs to be in an admin context and requries a successful UAC prompt, but will run without requiring a RunAs, making delivery more flexible than the other MSI methods.
Only use this in an ethical and legal manner. 
For red team engagements, depending on context you may want to remove the system alerts and comments.  
See Readme.md file for instructions.  

"""

import ctypes
import os
import subprocess
import sys
import time
import tkinter as tk
from tkinter import messagebox


def ensure_requests_installed():
    """Install requests library if missing."""
    try:
        import requests
        return True
    except ImportError:
        try:
            subprocess.run(
                [sys.executable, "-m", "pip", "install", "requests"],
                check=True, capture_output=True
            )
            import requests
            return True
        except Exception as e:
            raise RuntimeError(f"Failed to install 'requests' library: {e}")


def is_admin():
    """Check if script is running with administrator privileges."""
    try:
        return ctypes.windll.shell32.IsUserAnAdmin() != 0
    except:
        return False


def run_as_admin():
    """Re-launch script with administrator privileges."""
    script = os.path.abspath(sys.argv[0])
    params = " ".join(f'"{arg}"' for arg in sys.argv[1:])
    
    result = ctypes.windll.shell32.ShellExecuteW(
        None, "runas", sys.executable, f'"{script}" {params}', None, 1
    )
    
    if result <= 32:
        raise RuntimeError("Failed to elevate to administrator privileges.")


def show_message(title, message, msg_type="info"):
    """Display message box with fallback to console."""
    try:
        root = tk.Tk()
        root.withdraw()
        
        if msg_type == "info":
            messagebox.showinfo(title, message)
        elif msg_type == "warning":
            messagebox.showwarning(title, message)
        elif msg_type == "error":
            messagebox.showerror(title, message)
        
        root.destroy()
    except:
        print(f"[{title}] {message}")


def download_file(url, save_path):
    """Download file from URL to save_path."""
    try:
        import requests
        
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        
        response = requests.get(url, stream=True, timeout=60, headers=headers, allow_redirects=True)
        response.raise_for_status()
        
        # Verify we got a binary file, not an HTML error page
        content_type = response.headers.get('content-type', '').lower()
        if 'text/html' in content_type:
            raise RuntimeError("Received HTML content instead of installer file")
        
        with open(save_path, 'wb') as f:
            for chunk in response.iter_content(chunk_size=8192):
                if chunk:
                    f.write(chunk)
        
        return True
        
    except Exception as e:
        print(f"Download failed: {e}")
        return False


def main():
    # Configuration
    installer_name = "Splashtop_agent(My_Organization).msi"
    download_url = "(Paste Install URL here)"  # Replace with your Splashtop MSI URL from access and build area
    
    # Validate configuration
    if download_url == "(Paste Install URL here)":
        show_message("Configuration Error", 
                    "Please update the download_url variable with your actual Splashtop download URL.", 
                    "error")
        sys.exit(1)
    
    # Check for administrator privileges
    if not is_admin():
        try:
            run_as_admin()
            return
        except RuntimeError:
            show_message("Administrator Required", 
                        "Administrator privileges are required to install the MSI package.\n"
                        "Please run as administrator or accept the UAC prompt.", 
                        "error")
            sys.exit(1)
    
    # Ensure requests library is available
    try:
        ensure_requests_installed()
    except RuntimeError as e:
        show_message("Dependency Error", 
                    "Failed to install required Python packages. Please check your internet connection.", 
                    "error")
        sys.exit(1)
    
    # Download the installer
    script_folder = os.path.dirname(os.path.abspath(__file__))
    download_path = os.path.join(script_folder, installer_name)
    
    print("Downloading Splashtop agent...")
    if not download_file(download_url, download_path):
        show_message("Download Failed", 
                    "Failed to download the installer.\n\n"
                    "Please check your internet connection and verify the download URL is correct.", 
                    "error")
        sys.exit(1)
    
    # Verify download
    if not os.path.exists(download_path) or os.path.getsize(download_path) < 1024:
        show_message("Download Failed", 
                    "Downloaded file is missing or too small. Please try again.", 
                    "error")
        sys.exit(1)
    
    # Install the MSI
    print("Installing Splashtop agent...")
    try:
        result = subprocess.run([
            "msiexec", 
            "/i", download_path, 
            "/qn", 
            "/norestart"
        ], capture_output=True, text=True, timeout=300)
        
        exit_code = result.returncode
        
    except subprocess.TimeoutExpired:
        show_message("Installation Timeout", 
                    "Installation timed out. Please try again or install manually.", 
                    "error")
        sys.exit(1)
    except Exception as e:
        show_message("Installation Error", 
                    f"Failed to run installer: {e}", 
                    "error")
        sys.exit(1)
    
    # Handle installation results
    if exit_code == 0:
        show_message("Installation Complete", 
                    "Splashtop agent has been installed successfully.", 
                    "info")
    elif exit_code == 3010:
        show_message("Installation Complete - Reboot Required", 
                    "Splashtop agent has been installed successfully.\n\n"
                    "A system reboot is required to complete the installation.", 
                    "warning")
    else:
        show_message("Installation Failed", 
                    f"Installation failed with exit code: {exit_code}\n\n"
                    "Please try installing manually or contact support.", 
                    "error")
        sys.exit(1)
    
    # Clean up downloaded file
    try:
        os.remove(download_path)
    except:
        pass  # Ignore cleanup errors
    
    print("Installation completed successfully.")


if __name__ == "__main__":
    main()
