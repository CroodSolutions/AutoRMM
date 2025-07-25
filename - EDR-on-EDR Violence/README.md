# Introduction
Based upon the recent post by @BushidoToken indicating that threat actors were actively leveraging EDR/AV products as part of their attack cycle, we did some testing to see what capabilities may be readily available to attackers using EDR tools for nefarious purposes. This testing aligned closely with the work on RMM we were doing already. After all, an EDR often includes remediation and remote management as a core capability.  

Our (@ShammahWoods w/ @CroodSolutions) initial testing revealed that multiple EDR/AV products allowed for free trials providing a high potential for abuse, including various capabilities including remote shell, device containment, among other capabilities.

The most curious capability we observed, was the ability to use one EDR to kill another EDR (free version vs installed), along with less serious, but also concerning capability to hijack the reporting of an EDR/AV by installing an attacker-controlled trial of the same EDR/AV that is already running (so far we have only tested the second scenario with ESET, but it probably works for at least some other products).  

# EDR-on-EDR Violence
In testing, it seems Cisco Secure Endpoint can be used to effectively kill other EDR products, without triggering alerts, with a free trial tenant. The following steps succeeded in killing CrowdStrike and Elastic Defend without any alerting in the respective consoles. For CrowdStrike, this was on a host with uninstall protection enabled.

# Steps to Validate EDR-on-EDR Violence
- Go to https://www.cisco.com/c/en/us/products/security/amp-for-endpoints/free-trial.html?utm_content=amp-free-trial and register for a free trial
- Wait a few minutes for the activation link, and follow their steps to register your tenant
- Once in the tenant, navigate to https://console.amp.cisco.com/download_connector, select the group "Protect", and download the agent
- Install the agent on your target machine (requires local admin)
- In the console, navigate to Management > Policies.
- Search for "Protect", and click the one for Windows
- Select the "Exclusions" tab, and remove all of them.
- Next, identify the SHA256 of the EDR process you are targeting either on the host or through the Cisco console
- Navigate to "Outbreak Control" > "Blocked Application"
- Click edit on the "Blocked Application List"
- Enter the SHA256, and click "Add"
- You are done. In testing, this took varying amounts of time to actually apply to the endpoint, from 15 minutes to an hour.

# Free Trials
Here are EDR/AV Products Identified w/ free trials and no verification:
- Rapid 7
- Elastic Defend
- Cisco Secure Endpoint (NAM/AMP)
- Trend Micro
- Huntress
- ESET
- Acronis
- Watch Guard
# Notable Capabilities
Here is a quick reporting of notable capabilities observed, for each product tested so far, based on very preliminary testing.  
## ESET
- Custom script execution
- Full device encryption
- Host isolation
- A ton of other pre-built management tasks
## Cisco Secure Endpoint (NAM/AMP)
- Block hashes/executables
- Block network traffic (IPs)
- Isolate host
## Trend Micro
- Remote shell with usual capabilities
- Execute custom scripts
- Isolate hosts
## Elastic Defend
- Isolate hosts
# Summary
Products with immediate unverified free trial and significant abuse potential:
 - Cisco
 - ESET Protect
 - Trend Vision One

Limited abuse potential and easy free trial was idenfified with a few additional products (contain only):
 - Elastic (contain and light recon)
 - Huntress (contain only - it was clear a lot of thought went into limiting abuse potential)

# Contain Host or Kill Process (who cares?)

Why do we care that an EDR can install on a free trial and contain the host or kill a process? The most obvious answer we already covered, with EDR-on-EDR violence, although there are other reasons lesser capabilities (such as host containment) may be important.  

Even if the attacker installed product cannot kill the existing EDR product, they may use it to contain the host, and then do all sorts of bad things on the host, without the native AV/EDR that is supposed to be there reporting back. While the example of Cisco Secure Endpoint killing Elastic Defend and Crowdstrike Falcon Protect may not work for every product combination, containing a host seems like it is certain to blind almost any EDR tool, as a secondary scenario. In testing so far, neither activity sets off warning flags, because it is just an EDR/AV doing what EDRs do - or at least, until it is too late.

While there are many other options for killing or blinding EDR such as BYOVD, DLL Unhooking, or blinding via hostfile or host fw rule, a free trial of a competing endpoint product could be a lower bar to reach.  

# What it Means if Vendor Not Mentioned 

There are many EDR vendors that have not yet responed to requests for a free trial. This could be because they have solid verification processes, but it could also just be that we did not hit the right response options, to get a trial provisioned quickly (e.g., small org size, or proton mail screened us out). It also means we could get the free trial link shortly and it is merely delayed.

Research is ongoing and we will update this readme as we learn more.  

