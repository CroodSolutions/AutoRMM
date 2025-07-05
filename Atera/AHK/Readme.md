This test script is to install Atera RMM via MSI using AHK. Remember this requires admin to run the MSI version (right click script / Run as Administrator).

Basic instructions for testing:

  - Purchase the product or start your free trial at: https://www.atera.com/products/rmm/
  - It will prompt you to add your first device, but otherwise:
     - Go to Devices.
     - Select New Device.
     - Select Agent Installer.
     - Follow the propts / defaults work.
     - Select share download via link and click copy.
 - Create a new file with the .ahk file extension and paste in the script from this repo (Install-Atera.au3).
 - Edit the AHK script to replace "(Paste Install URL here)" with the actual URL you just copied (inside the quotes).
 - Right click Run as Administrator for script.   
 - Combine with PE, UAC Bypass Techniques, or other testing mode for increased realism for adversary simulation. 

Remember to use all AutoRMM tools only for ethical and legal self assessment, testing, or administration.
