# Looking Beyond RMM

As we were working on AutoRMM, BushidoToken pointed out that EDR products were being used in a similar manner. It seemed like it could be intersting to explore several EDR/AV products to see if any would be easy to abuse, by signing up for unverified free trial subscriptions.  

Our findings fell into a few categories:
 - Companies that did not fall for it / seemed to have a decent validation process.
 - Products that gave us an immediate free trial, but had very limited abuse potential or built in safeguards.
 - EDR/AV vendors that gave us an immediate unverfied free trial and demonstrated real abuse potential.

# Initial Findings

Products with immediate unverified free trial and significant abuse potential:
 - ESET Protect
 - Trend Vision One

Limited abuse potential and easy free trial was idenfified with a few additional products (contain only):
 - Elastic (contain and light recon)
 - Huntress (contain only - it was clear a lot of thought went into limiting abuse potential)
 - Cisco Amp (was able to install and kill elastic, without alerting. 

# Contain Host or Kill Process (who care's)

Why do we care that an EDR can install on a free trial and contain the host or kill a process? This could be intersting, because it may be possible to install a legit EDR/AV product, use it to contain the host, and then do all sorts of bad things on the host, without the native AV/EDR that is supposed to be there reporting back. While the example of Cisco Amp killing Elastic may not work on every endpoint agent, containing a host seems like it is certain to blind almost any EDR tool. It does not set off warning flags, because it is just an EDR/AV doing what EDRs do - or at least, until it is too late for it to be considered a problem. 

While there are many other options for this such as BYOVD, DLL Unhooking, or blinding via hostfile or host fw rule, a free trial of a competing endpoint product could be a lower bar to reach.  

# What it Means if Vendor Not Mentioned 

There are many EDR vendors that have not yet responed to requests for a free trial. This could be because they have solid verification processes, but it could also just be that we did not hit the right response options, to get a trial provisioned quickly (e.g., small org size, or proton mail screened us out). It also means we could get the free trial link shortly and it is merely delayed.

Research is ongoing and we will update this readme as we learn more.  
