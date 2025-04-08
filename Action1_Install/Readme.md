Action1 is easy to install, and useful for both remote administration and red teaming scenarios.  

Basic instructions for testing:

  - Setup Action1, create an account, and for best results go through the verification process.  
  - Click the Blue Install Agent button, and select Copy URL.
  - Start your testing process with a VM that has AutoIT installed. 
  - Edit the AutoIT Script to replace (Paste Install URL here) with the actual URL you just copied. 
  - Save the file with a .au3 file extension.  
  - Right click, and opt to compile this to an AutoIT executable. 
  - Run the exe as administrator on your test host, and watch for it to connect in the Action1 dashboard.  

What now?

Test to see what you can do.  With an unverified account, you can still take some pretty powerful actions on the host, such as to disable the firewall or to change a local password (including the admin password).

As a defender, run this in a test VM with your typical configuration and detection tools, and see if it is detected. 

If you are red teamer, consider using this in a penetration test, if there is either a social engineering component (talk them into running as admin), or as a post-exploit tool to add and expand remote management capabilities after using another delivery mechanism, such as AutoPwnKey (or any beacon and C2 framework / custom payload).

Remember to use all AutoRMM tools only for ethical and legal self assessment, testing, or administration.  
