
import ctypes
import os
import subprocess
import sys
import time
import requests
def main():
    installer_name = "meshagent.exe"
    download_url   = "(Replace with your MeshCentral agent download URL)"

    script_dir = os.path.dirname(os.path.abspath(__file__))
    download_path = os.path.join(script_dir, installer_name)

    print("Downloading MeshCentral agent installer...")
    try:
        resp = requests.get(download_url, timeout=60)
        if resp.status_code != 200:
            raise RuntimeError(f"Download failed: HTTP {resp.status_code} - {resp.reason}")
        with open(download_path, "wb") as f:
            f.write(resp.content)
    except Exception as e:
        print(f"Download error: {e}")
        sys.exit(1)

    time.sleep(3)

    if not os.path.exists(download_path):
        print(f"Download failed. File not found at: {download_path}")
        sys.exit(1)

    print("Running MeshCentral agent...")
    # Use run parameter to execute the agent
    proc = subprocess.run(
        [download_path, "run"],
        capture_output=True, text=True
    )
    exit_code = proc.returncode

    if exit_code == 0:
        print("MeshCentral agent installed successfully.")
    elif exit_code == 3010:
        print("Agent installed successfully. A reboot is required.")
    else:
        print(f"Installation failed with exit code: {exit_code}")
        if proc.stdout:
            print("Output:", proc.stdout)
        if proc.stderr:
            print("Error:", proc.stderr)

if __name__ == "__main__":
    main()