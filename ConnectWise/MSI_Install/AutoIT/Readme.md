This test script is to install ConnectWise ScreenConnect via MSI using AutoIT. This needs to be compiled as an AutoIT executable and run as administrator, for this version.  

Basic instructions for testing:

 - Create a ConnectWise ScreenConnect acount and sign up for the service or for a 14 day trial. 
 - URL: https://www.screenconnect.com/
 - Click "Access" on the navigation ribbon to the right (computer icon).  
 - Click the green "Build+" button.
 - Add values for all required fields
   Note: This actually creates the MSI download URL in the clear, which is interesting.
 - Create a new file with the .au3 file extension and paste in the script from this repo (Install-ScreenConnect.au3).
 - Click "Copy URL" to get your URL to pasted in the AutoIT script.
 - Edit the Au3 script to replace "(Paste Install URL here)" with the actual URL you just copied (inside the quotes).
 - Right click the script and select Compile Script (x64).
 - Run as the compiled exe as Administrator on the target host.  
 - Combine with PE, UAC Bypass Techniques, or other testing mode for increased realism for adversary simulation. 

Remember to use all AutoRMM tools only for ethical and legal self assessment, testing, or administration.
