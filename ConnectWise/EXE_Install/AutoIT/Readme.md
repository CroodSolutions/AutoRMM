Here are the steps to get started and to test using this script:
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
 - Run using the range of options available for executing AutoIT scripts.  

This script will work if the host has AutoIT installed, or if you deliver the script with the portable AutoIT executable and a wrapper to RunAs, or if you compile it as an AutoIT executable. Macro enabled office documents also work for delivery, using VBA as the wrapper to extract the scripts from ActiveX objects, as demonstrated with our AutoPwnKey project. The same approach as we applied for AutoPwnKey document delivery will also work for AHK and AutoIT scripts in AutoRMM. For an example of this type of delivery for AHK and AutoIT, see this resource: https://github.com/CroodSolutions/AutoPwnKey/tree/main/1%20-%20Covert%20Malware%20Delivery%20and%20Ingress%20Tool%20Transfer/CovertDelivery-Document 

Remember to use all AutoRMM tools only for ethical and legal self assessment, testing, or administration.
