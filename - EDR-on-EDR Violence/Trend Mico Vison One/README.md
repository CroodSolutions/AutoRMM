# Summary

Trend Micro Vision One abuse potential seemed high based on our brief testing, although the delivery seems a little complex since the install file is very large, comes zipped by default, and is a huge nested set of files. Of course, a real adversary may invest additional effort to figure out how to effectively deliver Trend. It would be advantageous for Trend to apply better customer validation prior to giving out trials and it is recommended to defenders to apply Application Control to block the application if not used in your environment. 

# Steps to Validate

 - Setup a free trial at: https://www.trendmicro.com/en_us/business/products/endpoint-security.html
 - Go to Endpoint menu on the left, and select Endpoint Inventory.
 - Select Agent Installer at the top of the screen in this view.
 - Scroll all the way down to Endpoint Sensor.
 - Download the installer, unzip, and run the EndpointBasecamp application in the top layer of tested folders.
 - When the host shows up in the Endpoint Inventory view, clicking the checkbox will make a range of options show up.
 - Among these options is a remote shell, shown below.

# Screen Shot Example of Remote Shell

An example of remote shell capability of Trend Vision One, operating under an unverified free trial.  

<img width="1785" height="729" alt="image" src="https://github.com/user-attachments/assets/43ca7576-a97f-426c-8bfd-45c2bf30f733" />
