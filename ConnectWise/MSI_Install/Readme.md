The MSI Install scripts are all focused on quick and easy testing, for blue/purple team scenarios where realistic adversary emulation may be less of a focus. The MSI installations are more fully featured and include persistence (whereas, remote suppoert sessions do not), so they could also be useful for red team scenarios, if combined with a delivery mechanism and privilege escalation that are MSI-friendly.  For simple testing, just set up the script and MSI download link, and RunAs admin following the instructions for each script type.  

Basic instructions for testing can be found in the readme for each script, although here are the general steps, as they apply across all of the MSI install scenarios:

 - Create a ConnectWise ScreenConnect acount and sign up for the service or for a 14 day trial. 
 - URL: https://www.screenconnect.com/
 - Click "Access" on the navigation ribbon to the right (computer icon).  
 - Click the green "Build+" button.
 - Add values for all required fields
   Note: This actually creates the MSI download URL in the clear, which is interesting.
 - Create a new file/script, with the appropriate file extension for the script type, and paste in the script from this repo (Install-ScreenConnect.filetype).
 - Click "Copy URL" to get your URL to pasted in the script.
 - Edit the script to replace "(Paste Install URL here)" with the actual URL you just copied (inside the quotes).
 - Run folliwing the instructions in each sub readme, for each script type
 - Combine with PE, UAC Bypass Techniques, or other testing mode for increased realism for adversary simulation. 

Remember to use all AutoRMM tools only for ethical and legal self assessment, testing, or administration.
