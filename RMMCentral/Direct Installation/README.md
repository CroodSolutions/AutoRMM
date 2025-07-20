Since this is a local product and not a SaaS, the simplest way to test is to set up a test VM running your usual security tools, install the management server for RMM Central right there, and then deploy an agent via the exe to test detection/prevention.  

We provided some other delivery methods to try via AutoHotKey and VBS, althogh if you want a quick easy test this will suffice.

RMM Central can be downloaded at: https://www.manageengine.com/remote-monitoring-management/download.html?pos=Downloads&loc=msps

Here are the basic steps to start testing:
 - Download the management/server software at the link above.
 - Follow the prompts.
 - Skip registration.
 - Add a Customer: Assign Customer Name, Company Name, and Email.
 - Under Agent, Agent Settings, uncheck “Show Agent Icon in the System Tray”
 - Select Download Endpoint Agent.
 - Run the executable on the target host.
 - Test some functionality, such as unattened remote access, CMD/PS, or other admin features.
 - Look for detections in AV/EDR.  

Remember to use AutoRMM only for legal and ethical testing purposes.  
