AnyDesk is a convenient and feature-rich Remote Management Tool (RMM) that is widely used due to perceived ease of use and performance. 

Unfortunately, this tool is also perceived to be easy to use by cybercriminals as well, evident by AnyDesk consistently appearing on lists of the most abused tools out there. Based upon our analysis, this is due to it installing in the user space and allowing for tremendous capabilities on the host, without user interaction. Safeguards against abuse seem to be almost non-existent.  

If you wish to use or test with AnyDesk, here is their web site: https://anydesk.com/

NOTE: At the time of initial AnyDesk testing, there was a working Python script; however, this started getting blocked by AnyDesk (download fail) even with a few different ways of setting up the script (including some better request headers). Good for them, in terms of whatever change they made to reduce abuse potential. Of course, further research and analysis of this request and response communication for the download link will probably reveal ways to get around this in time, or we also may explore having a Python script that initiates the download using another approach (a wrapper basically).  For now, the AHK, VBS, and AutoIT scripts should provide ample testing opportunity.  
