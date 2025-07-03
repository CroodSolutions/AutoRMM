This test script is to install ConnectWise ScreenConnect using VBS.

Basic instructions for testing:

 - Create a ConnectWise ScreenConnect acount and sign up for the service or for a 14 day trial. 
 - URL: https://www.screenconnect.com/
 - Click "Access" on the navigation ribbon to the right (computer icon).  
 - Click the green "Build+" button.
 - Add values for all required fields
   Note: This actually creates the MSI download URL in the clear, which is interesting.
 - Create a new file with the .vbs file extension and paste in the script from this repo (Install-ScreenConnect.vbs).
 - Click "Copy URL" to get your URL to pasted in the VBS script.
 - Edit the VBS script to replace "(Paste Install URL here)" with the actual URL you just copied (inside the quotes).
 - For basic testing to test detectability on a host, the easiest way to launch this is via PowerShell as admin: cscript "filepath\filename"
 - CMD run as admin with wscript "filepath\filename" will also work.
 - Red teamers will definitely want to find a more creative way to deliver this.
 - Combine with PE, UAC Bypass Techniques, or other testing mode for increased realism for adversary simulation. 

Remember to use all AutoRMM tools only for ethical and legal self assessment, testing, or administration.
