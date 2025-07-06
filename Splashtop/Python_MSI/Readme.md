Launching testing with Splashtop Remote Support Streamer:
 - Start your free trial or purchase the product.
 - Navigate to the Management tab on the main menu, and select Deployment.
 - Click the green Deploy button on the default package, or create a custom deployment.
 - Under option 2, select the dropdown and choose MSI.
 - Select F12 for debug mode, go to network, and filter on msi.
 - Click Download.
 - Refresh the browser if needed.
 - Copy the request URL used in the actual get request - this is the link you will paste into the script.
 - Copy the desired script from this repo and paste where it says "(Paste Install URL here)" (no parenthesis/just the outer quotes).
 - Save with the .py file extention.
 - Run the script.

Note: Unlike for ConnectWise ScreenConnect, for Splashtop there was no real difference in behavior between MSI and exe install, so created one script to test it and we are calling out that it exists, but not building out the full library of scripts for each.  

Remember to use all AutoRMM tools only for ethical and legal self assessment, testing, or administration.
