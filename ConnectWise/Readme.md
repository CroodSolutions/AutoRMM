ConnectWise ScreenConnect is a full-featured solution that provides tremendous remote access and management capabilities, surely contributing to their tremendous adoption rates and widespread use by MSPs. They have a great UI, quality documentation, and provide what it takes to make leveraging the great features they have developed easy.  

Unfortunately, it had less in the way of mechanisms to prevent abuse, when compared with some other RMM/remote access tools we examined.  It is easy to setup a free or low cost account, does not have a "cooling off period" to unlock high-risk features, and allows for remote management sessions via exe that can initiated in user land (although UAC still seems to be required).

When we consider these factors, It becomes obvious why it is so widely used by cybercriminals. 

Test scripts have been created for red/purple team assessment of ConnectWise ScreenConnect, to help understand how well abuse is blocked or detected, as well as to test your response procedures (does your SOC recognize abuse as a problem).

Two categories of test scripts have been created:
 - Install scripts for remote support sessions via an executable. 
 - Install the full client via MSI install. 

For more realistic adversary emulation or red team engagements, the remote support session scripts (via exe) may be preferable, although setup is a little more complicated (see readme for each script). For blue/purple team use cases where you want something quick and easy to see if your application control policies or EDR block/detect as expected, the MSI install scripts provide an easy button but must be run as admin vs. just requiring UAC for the user for exe (again, specific instructions on each readme).  

Please feel free to let us know of any issues or feedback. 
