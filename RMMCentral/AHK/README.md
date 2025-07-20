RMM Central can be downloaded at: https://www.manageengine.com/remote-monitoring-management/download.html?pos=Downloads&loc=msps

Here are the basic steps to start testing:
 - Download the management/server software at the link above.
 - Follow the prompts.
 - Skip registration.
 - Add a Customer: Assign Customer Name, Company Name, and Email.
 - Under Agent, Agent Settings, uncheck “Show Agent Icon in the System Tray”
 - Select Download Endpoint Agent.
 - Use CertUtil -encode (existing filename of exe here) Certificate.pem
 - You should have a rather large certificate file, which is a base64 encoded version of the exe.
 - Copy the Install-RMMCentral.ahk script and save it with the appropriate file extension.
 - You will deliver the files together and the script will extract the PEM file in the current working directory.
 - Test some functionality, such as unattened remote access, CMD/PS, or other admin features.
 - Look for detections in AV/EDR.

Note, as with our other AHK test scripts, you can either install AHK, compile to an AHK exe, or deliver with a wrapper that includes the AHK executable also.  

One delivery idea may be to try having a user download and mount a vmdk with both files prestaged.  

Remember to only use AutoRMM tools for red/purple team testing, in accordance with all laws and ethical standards.  
