Action1 is easy to install, and useful for both remote administration and red teaming scenarios.

Basic instructions for testing:

 - Setup Action1, create an account, and for best results go through the verification process.
 - Create a new file pasting in the AHK script from the repo, and save with the .ahk file extension.
 - In Action1, click the Blue Install Agent button, and select Copy URL.
 - Edit the AutoHotKey (AHK) Script to replace (Paste Install URL here) placeholder with the actual URL you just copied.
 - Save the file with an .ahk file extension.
 - Run AHK script as administrator, using the AutoHotKey application.
 - For easier testing, a .bat script is also included (run as administrator).
 - In order to use the .bat script, place the .bat wrapper scrip, a copy the portable AutoHotKey64.exe file, and the AHK install script.
 - Right click the .bat script and select Run as Administrator.
 - Check Action1 for connectivity.  

What now?

Test to see what you can do. With an unverified account, you can still take some pretty powerful actions on the host, such as to disable the firewall or to change a local password (including the admin password).

As a defender, run this in a test VM with your typical configuration and detection tools, and see if it is detected.

If you are red teamer, consider using this in a penetration test, if there is either a social engineering component (talk them into running as admin), or as a post-exploit tool to add and expand remote management capabilities after using another delivery mechanism, such as AutoPwnKey (or any beacon and C2 framework / custom payload).

Remember to use all AutoRMM tools only for ethical and legal self assessment, testing, or administration.
