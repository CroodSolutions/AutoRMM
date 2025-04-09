# AutoRMM

---What is AutoRMM?---

AutoRMM is a testing and red teaming framework we are building out, for covertly delivering and installing Remote Management and Screen Sharing tools, to begin to accurately simulate observed adversary activity in this area.  This is called AutoRMM not because it does anything automatically, but because we intend to start off using AutoIT and AutoHotKey, due to the evasiveness already noted in our other projects.  That said, we will not limit testing to exclusively these languages, in particular for the initial delivery and installation of RMM tools.  

---How is this different from BypassIT and AutoPwnKey---

BypassIT and AutoPwnKey are both frameworks intended to improve awareness around how a wide range of tactics that normally would be obvious to detect, become evasive when performed natively using AutoIT and AutoHotKey.  Unlike for these other projects, for AutoRMM, our goal is not to build a fully functional C2 framework using a given language, but instead to find out what C2 and post-exploitation activities can be enhanced or replaced by RMM tools - and also, explore detection engineering for these scenarios.  It is possible, even likely, features created here may later be integrated into these other frameworks, or that we may leverage functionality we have already created, when building AutoRMM.  That said, this framework has a different goal and purpose, which will likely cause it to evolve in different directions.  

---Why are we creating this? ---

We have noticed that adversaries are using a variety of delivery mechanisms to launch Remote Management / Screen Sharing tools, as an alternative or supplement to traditional beacons or C2 frameworks. It seemed important to come up with a realistic delivery methods and testing playbooks, for evaluating detectability for covert delivery and install of such tools, as well as how this approach may be combined with creative post-exploit methodologies.  

--- Ethical Standards / Code of Conduct ---

This project is to test a scenario that we have observed as an adversary trend, involving remote management tools.  We can only be successful at properly defending against adversary tactics, if we have the tools and resources to replicate the approaches being used by threat actors in an effective manner. Participation in this project and/or use of these tools implies good intent to use these tools ethically to help better protect/defend, as well as an intent to follow all applicable laws and standards associated with the industry.

--- How to Contribute ---

We welcome and encourage contributions, participation, and feedback - as long as all participation is legal and ethical in nature. Please develop new scripts, contribute ideas, improve the scripts that we have created. The goal of this project is to come up with a robust testing framework that is available to red/blue/purple teams for assessment purposes, with the hope that one day we can archive this project because improvements to detection logic make this attack vector irrelevant.

1. Fork the project
2. Create your feature branch (git checkout -b feature/AmazingFeature)
3. Commit your changes (git commit -m 'Add some AmazingFeature')
4. Push to the branch (git push origin feature/AmazingFeature)
5. Open a Pull Request

--- Acknowledgments ---

Key contributors, both directly and because we are using building blocks from prior work:

- [christian-taillon](https://github.com/christian-taillon)
- [BiniamGebrehiwot1](https://github.com/BiniamGebrehiwot1)
- [Duncan4264](https://github.com/Duncan4264)
- [shammahwoods](https://github.com/shammahwoods) 
- [flawdC0de](https://github.com/flawdC0de)
- [Kitsune-Sec](https://github.com/Kitsune-Sec)
- [AnuraTheAmphibian](https://github.com/AnuraTheAmphibian)

--- Key Resources / See Also ---

A tremendous resource we discovered as we were working on this, which we strongly recommend, is the LOL RMM site: https://lolrmm.io/ 
