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
 - Huntress (contain only)
 - Cisco Amp (was able to install and kill elastic, without alerting. 

Note: There are many EDR vendors that have not yet responed to requests for a free trial. This could be because they have solid verification processes, but it could also just be that we did not hit the right response options, to get a trial provisioned quickly (e.g., small org size, or proton mail screened us out).  

Research is ongoing and we will update this readme as we learn more.  
