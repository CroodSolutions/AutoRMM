Splashtop Remote Support / Streamer is a feature-rich product with tremendous capabilities for remote support / remote access. The unattended remote access stood out as particularly stealthy and free trial / account setup involves only minimal validation (took minutes).  

On the positive side for Splashtop, all of the direct install modes I found did require some user interaction. In addition to the usual UAC prompt, once the Splashtop Streamer software installs the app launches and the user has to click to continue. It does look like they ahve made some effort to try to curb abuse, although like most vendors they could do more. 

Interestingly enough, the more stealthy approach to launch Splashtop Streamer is to install another RMM such as Atera that provides the capability to launch unattended remote access using Splashtop. We tried to replicate this behavior in our testing scripts initially, but were unable to figure it out in the time allocated to examine each tool we have deemed as in scope. So far, Atera to launch Splashtop seems to be one of the more robust approaches we have discovered to date, from a red team perspective. 

If you do not use Splashtop as a legitimate remote access tool in your environment, we definitely recommend blocking it via an application control product such as WDAC and via application policies/rules in your firewall and/or secure web gateway.

 Basic setup steps:
 - Sign up for free trial or purchase the product at: https://www.splashtop.com/downloads
 - Download business app.
 - Sign into desktop app.
 - Verify email address.

Launching testing with Splashtop Remote Support Streamer:
 - Start your free trial or purchase the product.
 - Navigate to the Management tab on the main menu, and select Deployment.
 - Click the green Deploy button on the default package, or create a custom deployment.
 - Click the blue Try Link button.
 - Select F12 for debug mode, go to network, and filter on exe.
 - Check the box and click Download for Windows.
 - Refresh the browser if needed.
 - Copy the request URL used in the actual get request - this is the link you will paste into the script.
 - Copy the desired script from this repo and paste where it says "(Paste Install URL here)" (no parenthesis/just the outer quotes).
 - Save with the appropriate file extention.
 - Run according to specific instructions in specific Readme or comments.

Remember to use all AutoRMM tools only for ethical and legal self assessment, testing, or administration.
