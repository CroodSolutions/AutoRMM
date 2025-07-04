This test script is to install ConnectWise ScreenConnect using Python 3.

It is important to note that this script, unlike the other MSI install methods, does not require an admin context to run (although it does require a UAC prompt and admin context to be available). This could provide more flexibility for delivery, in cases where Python 3 is already installed on a host. Since the MSI install provides persistence and more features, this method may be preferred in a context where Python will run.  

Basic instructions for testing:

 - Create a ConnectWise ScreenConnect acount and sign up for the service or for a 14 day trial. 
 - URL: https://www.screenconnect.com/
 - Click "Access" on the navigation ribbon to the right (computer icon).  
 - Click the green "Build+" button.
 - Add values for all required fields
   Note: This actually creates the MSI download URL in the clear, which is interesting.
 - Create a new file with the .py file extension and paste in the script from this repo (Install-ScreenConnect.py).
 - Click "Copy URL" to get your URL to pasted in the VBS script.
 - Edit the Python 3 script to replace "(Paste Install URL here)" with the actual URL you just copied (inside the quotes).
 - To launch this, simply double click the file and click yes when the UAC prompt comes up.
 - The script could be modified to also work with know PE or UAC bypass techniques.  

Remember to use all AutoRMM tools only for ethical and legal self assessment, testing, or administration.
