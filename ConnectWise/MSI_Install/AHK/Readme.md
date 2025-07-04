This test script is to install ConnectWise ScreenConnect via MSI using AHK. Remember this requires admin to run the MSI version (right click script / Run as Administrator).

Basic instructions for testing:

 - Create a ConnectWise ScreenConnect acount and sign up for the service or for a 14 day trial. 
 - URL: https://www.screenconnect.com/
 - Click "Access" on the navigation ribbon to the right (computer icon).  
 - Click the green "Build+" button.
 - Add values for all required fields
   Note: This actually creates the MSI download URL in the clear, which is interesting.
 - Create a new file with the .ahk file extension and paste in the script from this repo (Install-ScreenConnect.au3).
 - Click "Copy URL" to get your URL to pasted in the AutoHotKey script.
 - Edit the AHK script to replace "(Paste Install URL here)" with the actual URL you just copied (inside the quotes).
 - Right click Run as Administrator for script.   
 - Combine with PE, UAC Bypass Techniques, or other testing mode for increased realism for adversary simulation. 

Remember to use all AutoRMM tools only for ethical and legal self assessment, testing, or administration.
