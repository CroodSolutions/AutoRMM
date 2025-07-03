This test script is to install ConnectWise ScreenConnect using VBS for a client support exe install.

Basic instructions for testing:

 - Create a ConnectWise ScreenConnect acount and sign up for the service or for a 14 day trial. 
 - URL: https://www.screenconnect.com/
 - Click "Support" on the navigation ribbon to the right (headset icon).  
 - Click the green "Create+" button.
 - Give your session a name, and select "Link" on the menu on the far right pane of the UI, and click "Copy"
 - Paste this into a browser bar on your attacker host, ignore the download and activate F12/debug mode.
 - Go to the network tab, filter by keyword zip, and refresh if needed.
 - Look for the Request URL for ScreenConnect.WindowsClient.zip on the network tab - copy this and set it aside for later.  
 - Create a new file with the .vbs file extension and paste in the script from this repo (Install-ScreenConnect.vbs).
   Note: Do not confuse the folders/code for client install/exe vs MSI.  
 - Edit the VBS script to replace "(Paste Install URL here)" with the actual URL you just copied (inside the quotes).
 - Double click; it will run this without launching as admin, although there will be a UAC prompt to the user.  

Remember to use all AutoRMM tools only for ethical and legal self assessment, testing, or administration.
