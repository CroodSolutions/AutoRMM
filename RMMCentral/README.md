Manage Engine RMM Central seems to be a robust and mature product, from a remote management perspective. It had a solid interface and was easy to setup and use. They do not have a SaaS offering, so it does require installation and configuration of their management server. 

Setup and installation was easy and did not require registration to start a 30-day free trial. This makes it simple to setup a local test of the software.  

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

This seemed to install without an UAC or PE required, although there was one user prompt. After that, it was unattended remote access and full control.  

Since there is no cloud or SaaS aspect to this product, the delivery methods we used for other products (download and run) seemed less relevant. We have attempted to deliver as an encoded certificate run via VBS, as an alternative to just delivering and running the executable.   

It is intersting to note that RMM Central also has a network probe tool that could be an intersting red/purple discovery asset to explore (less obvious that running NMAP or other known tools). Note that it does require the RMM Central server and a second enterprise software package installation to run, so definitely not a lightweight approach. That said, in a longer red teaming engagement it could make for an intesting approach that could be ignored by SOC/IR teams.  


<img width="995" height="608" alt="image" src="https://github.com/user-attachments/assets/01f340db-b78d-4246-8b73-4983744f9798" />
