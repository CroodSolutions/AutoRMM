Action1 is easy to install, and useful for both remote administration and red teaming scenarios.

Basic instructions for testing:

 - Setup Action1, create an account, and for best results go through the verification process.
 - Click the Blue Install Agent button, and select Copy URL.
 - Create a new file with the .py file extension and paste in the script from the repo.  
 - Edit the Python Script to replace "(Paste Install URL here)" with the actual URL you just copied (inside the quotes).
 - Make sure Python3 is installed.
 - Double click to run (need to be in admin context).
 - Sometimes a reboot is required.  

What now?

Test to see what you can do. With an unverified account, you can still take some pretty powerful actions on the host, such as to disable the firewall or to change a local password (including the admin password).

As a defender, run this in a test VM with your typical configuration and detection tools, and see if it is detected.

If you are red teamer, consider using this in a penetration test, if there is either a social engineering component (talk them into running as admin), or as a post-exploit tool to add and expand remote management capabilities after using another delivery mechanism, such as AutoPwnKey (or any beacon and C2 framework / custom payload).

Remember to use all AutoRMM tools only for ethical and legal self assessment, testing, or administration.
