Note that from a red/purple team perspective, the exe install is far more useful than the MSI install, because it can be launched from a user space and could be chained with various creative delivery mechanisms. It does still require a UAC prompt response, although there are probably a few ways to get around this that are out of scope for this project. 

It does involve a little more setup though, since the ConnectWise ScreenConnect web interface will not provide a direct download link for the EXE. Instead, it gives you a web page that redirects to the actual download URL, and it is this second URL that you need to paste into the script.

Here are the steps to extract the needed link (and general setup):
 - Create a ConnectWise ScreenConnect acount and sign up for the service or for a 14 day trial. 
 - URL: https://www.screenconnect.com/
 - Click "Support" on the navigation ribbon to the right (headset icon).  
 - Click the green "Create+" button.
 - Optionally name your new support session.
 - Click the tab to invite via "Link"
 - Paste this into a browser to load the original link they provide.
 - Hit F12 / activate debug mode.
 - Click the network tab of debugging tools, and filter on "zip"
 - Refresh the page again.
 - Now look for request URL, and copy out the actual link.  
 - Edit the script to replace "(Paste Install URL here)" with the actual URL you just copied (inside the quotes).
 - Run the file in accordance with any specific instructions in the comments and/or readme for each subfolder.

Remember to use all AutoRMM tools only for ethical and legal self assessment, testing, or administration.
