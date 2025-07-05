This test script is to install Atera RMM using VBS.

Basic instructions for testing:

 - Purchase the product or start your free trial at: https://www.atera.com/products/rmm/
 - It will prompt you to add your first device, but otherwise:
     - Go to Devices,
     - Select New Device
     - Select Agent Installer
     - Follow the propts / defaults work.
     - Select share download via link and click copy.
 - Create a new file with the .vbs file extension and paste in the script from this repo (Install-Atera.vbs).
 - Edit the VBS script to replace "(Paste Install URL here)" with the actual URL you just copied (inside the quotes).
 - For basic testing to test detectability on a host, the easiest way to launch this is via CMD as admin: cscript "filepath\filename"
 - Red teamers will definitely want to find a more creative way to deliver this.
 - Combine with PE, UAC Bypass Techniques, or other testing mode for increased realism for adversary simulation.

NOTE: Be sure to test the Splashtop integration for unattended remote access. The lack of user interaction or notification for this flow is definitely something to be aware of / to test and consider.  

Remember to use all AutoRMM tools only for ethical and legal self assessment, testing, or administration.
