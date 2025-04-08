import ctypes
import os
import subprocess
import sys

def ensure_requests_installed():
    """Attempt to import 'requests'. If missing, run pip install requests."""
    try:
        import requests
        return True
    except ImportError:
        print("Module 'requests' not found. Attempting to install...\n")
        try:
            subprocess.run(
                [sys.executable, "-m", "pip", "install", "requests"],
                check=True
            )
            import requests
            return True
        except Exception as e:
            print(f"Failed to install 'requests': {e}")
            return False

def is_admin():
    """Check if this script is running with administrator privileges."""
    try:
        return ctypes.windll.shell32.IsUserAnAdmin() != 0
    except:
        return False

def run_as_admin():
    """Re-run this script with admin rights via ShellExecute."""
    script = os.path.abspath(sys.argv[0])
    params = " ".join(f'"{arg}"' for arg in sys.argv[1:])
    ctypes.windll.shell32.ShellExecuteW(
        None, "runas", sys.executable, f'"{script}" {params}', None, 1
    )

def main():
    # Elevation check
    if not is_admin():
        print("Not running as administrator. Elevating...\n")
        run_as_admin()
        sys.exit(0)

    # Ensure 'requests' is installed
    if not ensure_requests_installed():
        print("Cannot continue without 'requests' library. Exiting.")
        sys.exit(1)

    import requests

    installer_name = "action1_agent(My_Organization).msi"
    download_url   = "(Paste Install URL here)"

    script_dir = os.path.dirname(os.path.abspath(__file__))
    download_path = os.path.join(script_dir, installer_name)

    print("Downloading Action1 agent installer...")
    try:
        resp = requests.get(download_url, timeout=60)
        if resp.status_code != 200:
            print(f"Download failed: HTTP {resp.status_code} - {resp.reason}")
            sys.exit(1)
        with open(download_path, "wb") as f:
            f.write(resp.content)
    except Exception as e:
        print(f"Download error: {e}")
        sys.exit(1)

    if not os.path.exists(download_path):
        print(f"Download failed. File not found at: {download_path}")
        sys.exit(1)

    print("Installing Action1 agent silently...")
    proc = subprocess.run(
        ["msiexec", "/i", download_path, "/qn", "/norestart"],
        capture_output=True, text=True
    )
    exit_code = proc.returncode

    if exit_code == 0:
        print("Action1 agent installed successfully.")
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
