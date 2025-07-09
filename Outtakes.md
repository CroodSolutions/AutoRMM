# Outtakes

This will be a summary of tools we have tested and/or analyzed, but did not create a test script for, for various reasons.

# DWservice (DWS)

This service had a rather rough interface and the method for admin deployment did not seem to work in our limited testing. It provides folder and file access, command line, and other capabilities once installed and is a free tool, so the abuse potential is definitely there. On the up side, the install exe had lots of user interactions and the silent install did not seem to work at all.  We determined it was not a tool that would be a good candidate for test scripts; however, it should be one that you block if you are not using it for legitimate purposes.  

DWS URL: https://www.dwservice.net/en/home.html

# Microsoft Quick Assist 

Microsoft has a native remote management tool that is commonly abused; typically due to Social Engineering. I made some attempts to create scripts to launch Quick Assist and send keystrokes to enter a code to connect, but the operations for other apps to paste in a code did not seem to work. Of course, there is no doubt there is a way around whatever restrictions they have put in place. There almost always are, although it was clear that the level of effort would exceed easier RMM or RAT access paths. That said, considering it is super easy to test natively as part of windows, I recommend you just test this one manually as part of your RMM assessment.  
 - Launch Quick Assist on target host (via Social Engineering or other method).
 - Setup Quick Assist session to "Help Someone"
 - Provide the code to the end user.
 - Test detection and response processes while attempting a few activities via Quick Assist.  
