# Summary 

This is a red team testing script for a weaponized document delivery of RMM Central, where the document opens causing the ThisDocument script launch Module1 'Retrieve File' that in turn downloads a file from a staging location, writes it to disk, and then runs it with the silent flag. 

# Setup Steps
 - Create your lure document (should include some pretext for clicking "Enable Content" for realistic testing (save as .docm). 
 - Download the RMM Central management/server software at this link: https://www.manageengine.com/remote-monitoring-management/download.html?pos=Downloads&loc=msps
 - Follow the prompts.
 - Skip registration.
 - Add a Customer: Assign Customer Name, Company Name, and Email.
 - Under Agent, Agent Settings, uncheck “Show Agent Icon in the System Tray”
 - Select Download Endpoint Agent.
 - Launch VBA Editor via the Developer tab or ALT+F11.
 - Paste LaunchText.txt under Normal > Microsoft Word Objects > ThisDocument.
 - Then, paste Delivery.txt into Normal > Modules > Module1.
 - Save/close VBA editor.
 - Save doc.
 - Test your scenario.

# Key points
 - This will only support small payloads, so an AutoIT/AHK compiled exe from AutoRMM will be fine, and some of the more reasonable sized RMM direct EXEs could work also (exactl limites not well defined).
 - Macro enabled documents are considered sus by many security products, and sandboxing solutions seem to catch this with ease, so milage may vary.

# Ethical Considerations 

These tools are made to help raise awarness about some serious security gaps adversaries are exploiting in the wild, by providing penetration testing / red team resources. Use of these tools assume an ethical blue/purple/red team scenario where you are using these tools to ethically test your security posture and controls. We do not support or endorse malicious or criminal use of assessment, security, or administrative tools.
