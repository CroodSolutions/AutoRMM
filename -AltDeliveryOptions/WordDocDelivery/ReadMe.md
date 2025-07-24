# Summary 

This is a red team testing script for a weaponized document delivery of RMM Central, where the document opens causing the ThisDocument script launch Module1 'Retrieve File' that in turn downloads a file from a staging location, writes it to disk, and then runs it with the silent flag. 

# Setup Steps
 - Create your lure document (should include some pretext for clicking "Enable Content" for realistic testing (save as .docm). 
 - Stage the agent installer payload in a location that can be reached from the target host, to serve the file up via http.
 - If you use a cloud service, note that the download link will almost never be the real link.
 - To resolve this click through the usual download steps with debug (F12) enabled and set to networking.
 - Usually it is easy enough to filter on file extention, but sometimes it is easier to find with no filters.
 - Copy the http/s download URL from where you staged the RMM install file and paste it into the script.  
 - Launch VBA Editor via the Developer tab or ALT+F11.
 - Paste Normal_ThisDocument.txt under Normal > Microsoft Word Objects > ThisDocument.
 - Then, paste Module1_RetrieveFile.txt into Normal > Modules > Module1.
 - Save/close VBA editor.
 - Save doc.
 - Test your scenario.

# Key points
 - Large install files such may take time to download and launch, making it fine for purple team testing, but could cause some sporadic abandoned deliveries for red team engagements.
 - This approach works best for red teams when the delivery payload is small or there is a pretext to make the user expect the document to take time to load. 
 - Macro enabled documents are considered sus by many security products, and sandboxing solutions seem to catch this with ease, so milage may vary.
 - Combining tactics, such as delivering the document via vmdk, password protected zip, or other creative means may help red teams.  

# Ethical Considerations 

These tools are made to help raise awarness about some serious security gaps adversaries are exploiting in the wild, by providing penetration testing / red team resources. Use of these tools assume an ethical blue/purple/red team scenario where you are using these tools to ethically test your security posture and controls. We do not support or endorse malicious or criminal use of assessment, security, or administrative tools.


# Demo Video

Note: No audio / lots of load time, so feel free to time travel.  :)

https://github.com/user-attachments/assets/f06517a2-9842-499c-b350-7bf44c06f955

