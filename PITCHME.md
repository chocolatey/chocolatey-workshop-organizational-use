@title[Managing Organizational Use Of Chocolatey]

## Managing Organizational Use Of Chocolatey
### Best practices for setting up and using Chocolatey within your Organization

![WinOps Logo](assets/images/winops_logo.png)

---

@title[Who Am I? - Gary Ewan Park]
@transition[none]

@snap[north-west]
@css[choco-blue](WHO AM I?)
@snapend

@snap[west span-65]
Senior Software Engineer @ Chocolatey Software
<br>
<br>
![MVP Logo](assets/images/mvp.jpg)
![Cake Build](assets/images/cake.png)
@snapend

@snap[east span-30]
![Gary Ewan Park](assets/images/gary-avatar.png)
<br>
@css[bio-name](Gary Ewan Park)
@snapend

@snap[south-west bio-contact]
@fa[twitter twitter-blue]&nbsp;&nbsp;gep13&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
@fa[github text-black]&nbsp;&nbsp;github.com/gep13&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
@fa[home text-blue]&nbsp;&nbsp;gep13.co.uk&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
@fa[envelope choco-blue]&nbsp;&nbsp;gary@chocolatey.io
@snapend

+++

@title[Who Am I? - Paul Broadwith]
@transition[none]

@snap[north-west]
@css[choco-blue](WHO AM I?)
@snapend

@snap[west span-65]
Senior Technical Engineer @ Chocolatey Software
<br>
<br>
25+ years in IT
<br/>
![MVP Logo](assets/images/mvp.jpg)
@snapend

@snap[east span-30]
![Paul Broadwith](assets/images/paul.png)
<br>
@css[bio-name](Paul Broadwith)
@snapend

@snap[south-west bio-contact]
@fa[twitter twitter-blue]&nbsp;&nbsp;pauby&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
@fa[github text-black]&nbsp;&nbsp;github.com/pauby&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
@fa[home text-blue]&nbsp;&nbsp;pauby.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
@fa[envelope choco-blue]&nbsp;&nbsp;paul@chocolatey.io
@snapend

---

@title[Agenda]
@transition[none]

@snap[north-west]
@css[choco-blue](Agenda)
@snapend

@title[Agenda]
@transition[none]

@snap[north-west]
@css[choco-blue](Agenda)
@snapend

@snap[west]
@ul[](false)

* 09:00: Workshop Starts
* 10:30: Coffee Break
* 12:30: Workshop Ends

@ulend
<br/><br/>
Please feel free to interrupt for any questions that you might have.
@snapend

+++

@title[Agenda]
@transition[none]

@snap[north-west]
@css[choco-blue](Agenda)
@snapend

@snap[west]
@ul[](false)

* Get access to workshop environments
* Chocolatey fundamentals
* Configuring package repositories
* Using Chocolatey self-service
* How to use Chocolatey sync command
* Combining Chocolatey and Configuration Management
* Chocolatey Central Management

@ulend
@snapend

---

@title[Pre-Requisites]
@transition[none]

@snap[north-west]
@css[choco-blue](Pre-Requisites)
@snapend

@snap[west]
@ul[](false)

* Computer with network connection and RDP client
  * on Windows, you are probably all set
  * on macOS, get Microsoft Remote Desktop from the App Store
  * on Linux, get [remmina](https://wiki.ubuntuusers.de/remmina/)
* Some Chocolatey knowledge
  * but it's OK if you are not a Chocolatey expert!
@ulend
@snapend

+++

@title[Slide Navigation]

@snap[north-west]
@css[choco-blue](Slide Navigation)
@snapend

* Next Slide - `n` or `Page Down`
* Previous Slide - `p` or `Page Up`

Would recommend not using arrow keys.

+++

@title[Hands-on Sections]
@transition[none]

@snap[north-west]
@css[choco-blue](Hands-on Sections)
@snapend

@snap[north span-100]
<br><br>
@ul[](false)

* Uses Chocolatey 0.10.15
* All hands-on section are clearly identified, like the rectangle below:

@ulend
@snapend

@snap[south exercise-box]

@fa[keyboard-o]()&nbsp;Exercise
<br>
@ul[](false)

* This is the stuff you are supposed to do!
* Go to [this url](https://gitpitch.com/chocolatey/chocolatey-workshop-organizational-use/master) to view these slides.

@ulend
@snapend

+++

@title[Terminals]
@transition[none]

@snap[north-west]
@css[choco-blue](Terminals)
@snapend

Once in a while, the instructions will say:

@quote[Open a new terminal]

![PowerShell Terminal](assets/images/terminal.png)

This needs to be an Administrator session.

* Press [Windows], type `powershell`, right click on entry and select `Run as Administrator`

+++

@title[Test RDP Access]
@transition[none]

@snap[north-west]
@css[choco-blue](Test RDP Access)
@snapend

You should have been given a piece of paper like this:

![RDP Access](assets/images/rdp-access.png)

Test login credentials to make sure you have access.

**NOTE:** Initial login will likely cause a reboot of VM.

---

## Chocolatey Fundamentals

+++

@title[What is Chocolatey?]

## What is Chocolatey?

+++

@title[A Definition...]

### A Definition...

@quote[Chocolatey allows you to deploy any Windows software, anywhere, with anything, and manage and track that software over time.](Rob Reynolds - Creator of Chocolatey)

+++

#### Chocolatey is a package manager for Windows

+++

#### Similar to apt-get, yum, and Homebrew

+++

### With Chocolatey you can...

* Manage ANY software, not just installers
* Define dependencies
* Write a software deployment one time (with PowerShell)
* Test your deployment before deploying to Production
* Deploy to any supported version of Windows (including Server.Core and Docker Containers)
* Track and Report on software

+++?image=assets/images/magic.gif&size=45% auto&color=#A74433

@title[It's Magic!]

---

## How does Chocolatey work?

+++

@title[Let's install paint.net]

## Let's install paint.net...

+++

@title[paint.net website]

<!-- .slide: data-transition="none" -->
![Build Step](assets/images/install-paint.net-step-1.png)

+++

@title[Not the paint.net website]

<!-- .slide: data-transition="none" -->
![Build Step](assets/images/install-paint.net-step-2.png)

+++

@title[Google paint.net]

<!-- .slide: data-transition="none" -->
![Build Step](assets/images/install-paint.net-step-3.png)

+++

@title[Actual paint.net website]

<!-- .slide: data-transition="none" -->
![Build Step](assets/images/install-paint.net-step-4.png)

+++

@title[paint.net download]

<!-- .slide: data-transition="none" -->
![Build Step](assets/images/install-paint.net-step-5.png)

+++

@title[Mirror website]

<!-- .slide: data-transition="none" -->
![Build Step](assets/images/install-paint.net-step-6.png)

+++

@title[Actual paint.net download]

<!-- .slide: data-transition="none" -->
![Build Step](assets/images/install-paint.net-step-7.png)

+++

@title[Unblock zip file]

<!-- .slide: data-transition="none" -->
![Build Step](assets/images/install-paint.net-step-8.png)

+++

@title[Extract zip file]

<!-- .slide: data-transition="none" -->
![Build Step](assets/images/install-paint.net-step-9.png)

+++

@title[Install paint.net]

<!-- .slide: data-transition="none" -->
![Build Step](assets/images/install-paint.net-step-10.png)

+++

@title[paint.net dependencies]

<!-- .slide: data-transition="none" -->
![Build Step](assets/images/install-paint.net-step-11.png)

+++

@title[There has to be a better way!]

## @fa[quote-left] There has to be a better way!

+++

@title[Chocolatey]

![Chocolatey](assets/images/icon.png)

---

## Install putty

@snap[center exercise-box]

@fa[keyboard-o]()&nbsp;Exercise
<br>

@ul[](false)
* Open a terminal and run the following command:
@ulend
<pre><code class="lang-powershell hljs"><span class="line">choco install putty</span></code></pre>

@snapend

+++

## Result

![Output from choco install putty](assets/images/choco-install-putty.png)

---

# Sources

TODO: Need to add some information here about Nexus

+++

## Sources

What is a Chocolatey Source?

+++

## List current Sources

@snap[center exercise-box]

@fa[keyboard-o]()&nbsp;Exercise
<br>
@ul[](false)
* Open a terminal and run the following command:
@ulend
<pre><code class="lang-powershell hljs"><span class="line">choco source</span><span class="line">choco source list</span></code></pre>

@snapend

+++

## Result

![Output from choco source](assets/images/choco-source.png)

+++

## Add Test Repository Source

+++

## Result

+++

## Add Production Repository Source

---

## Chocolatey Self Service

+++

## Open Chocolatey GUI

@snap[center exercise-box]

@fa[keyboard-o]()&nbsp;Exercise
<br>
@ul[](false)
* Open a terminal and run the following command:
@ulend
<pre><code class="lang-powershell hljs"><span class="line">chocolateygui</span></code></pre>

@snapend

+++

## Result

![Chocolatey GUI](assets/images/chocolatey-gui.png)

+++

## Setup Self Service

@snap[center exercise-box]

@fa[keyboard-o]()&nbsp;Exercise
<br>
@ul[](false)
* Open a terminal and run the following commands:
@ulend
<pre><code class="lang-powershell hljs"><span class="line">choco feature disable --name="'showNonElevatedWarnings'"</span><span class="line">choco feature enable --name="'useBackgroundService'"</span><span class="line">choco feature enable --name="'useBackgroundServiceWithNonAdministratorsOnly'"</span></code></pre>

@snapend

+++

## Switch to Non-Admin account

@snap[center exercise-box]

@fa[keyboard-o]()&nbsp;Exercise
<br>

@ul[](false)
- Log out as the current user
- Log in as the nonAdmin user
@ulend

@snapend

+++

## Let's install MalwareBytes

@snap[center exercise-box]

@fa[keyboard-o]()&nbsp;Exercise
<br>

@ul[](false)
- Browse to the c:/installers folder
- Double click the MalwareBytes installer
- It will fail with an error, i.e. not enough permissions
@ulend
@snapend

+++
## Result

![Malwarebytes Install Error](assets/images/malwarebytes_install_error.png)

+++

## Let's try that again...

@snap[center exercise-box]

@fa[keyboard-o]()&nbsp;Exercise
<br>

@ul[](false)
- Open Chocolatey GUI
- Switch to the chocolatey source and search for malwarebytes
- Right click and select install
- Go to Add Remove Programs, and verify it is installed correctly
@ulend
@snapend

+++

## Result

![Malwarebytes Install Success](assets/images/malwarebytes_install_success.png)

---

## Choco Sync

+++

@title[What is Choco Sync]

## What is Choco Sync?

+++

@quote[Chocolatey maintains its own state of the world, while Windows maintains the state of Programs and Features. If an application is upgraded or uninstalled outside of Chocolatey, such as is the case with Google Chrome and its auto updating utility, Chocolatey doesn't know about the change. The synchronize feature keeps Chocolatey's state in sync with Programs and Features, removing possible system-installed state drift.]

+++

## Automatic Sync

@snap[center exercise-box]

@fa[keyboard-o]()&nbsp;Exercise
<br>

@ul[](false)
* Open a terminal and run the following command:
@ulend

<pre><code class="lang-powershell hljs"><span class="line">choco list -lo</span></code></pre>
@snapend

+++

## Result

![Malwarebytes Before Choco Sync](assets/images/choco-sync-malwarebytes-before.png)

+++

## Let's uninstall Malwarebytes

@snap[center exercise-box]

@fa[keyboard-o]()&nbsp;Exercise
<br>

@ul[](false)
* Open Add/Remove programs and manually uninstall Malwarebytes
* Open a terminal and run the following command:
@ulend

<pre><code class="lang-powershell hljs"><span class="line">choco list -lo</span></code></pre>
@snapend

+++

## Result

![Malwarebytes After Choco Sync](assets/images/choco-sync-malwarebytes-after.png)

+++

## Sync Command

@snap[center exercise-box]

@fa[keyboard-o]()&nbsp;Exercise
<br>

@ul[](false)
* Open a terminal and run the following command:
@ulend

<pre><code class="lang-powershell hljs"><span class="line">choco list -li</span></code></pre>
@snapend

+++

## Result

![VLC Before Choco Sync](assets/images/choco-sync-vlc-before.png)

+++

## Sync Command

@snap[center exercise-box]

@fa[keyboard-o]()&nbsp;Exercise
<br>

@ul[](false)
* Open a terminal and run the following command:
@ulend

<pre><code class="lang-powershell hljs"><span class="line">choco sync --id="'VLC media player'" --package-id="'vlc'"</span></code></pre>

@ul[](false)
* Run the following command:
@ulend

<pre><code class="lang-powershell hljs"><span class="line">choco list -li</span></code></pre>
@snapend

+++

## Result

![VLC After Choco Sync](assets/images/choco-sync-vlc-after.png)

+++

## And now to upgrade it...

@snap[center exercise-box]

@fa[keyboard-o]()&nbsp;Exercise
<br>

@ul[](false)
* Open a terminal and run the following command:
@ulend

<pre><code class="lang-powershell hljs"><span class="line">choco outdated</span></code></pre>
@snapend

+++

## Result

![Choco outdated](assets/images/choco-outdated-vlc.png)

+++

## And now to upgrade it...

@snap[center exercise-box]

@fa[keyboard-o]()&nbsp;Exercise
<br>

@ul[](false)
* Open a terminal and run the following command:
@ulend

<pre><code class="lang-powershell hljs"><span class="line">choco upgrade vlc</span></code></pre>
@snapend

+++

## Result

![Choco Upgrade VLC](assets/images/choco-upgrade-vlc.png)

---

## Chocolatey Central Management

+++

@title[What is Chocolatey Central Management?]

## What is Chocolatey Central Management?

+++

@quote[CCM provides you insights across your desktop and endpoint environments.]o

![CCM Overview](assets/images/ccm_overview.jpg)

+++

Once installed and configured, you can use CCM to:

* bring reporting to teh Organisational level
* quickly see all software across the Organization and see what needs attention immediately
* create reports for tracking and auditing purposes

+++

# Demo

+++

## CCM in action...

@snap[center exercise-box]

@fa[keyboard-o]()&nbsp;Exercise
<br>

@ul[](false)
- Open a terminal and execute the following:
@ulend

<pre><code class="lang-powershell hljs"><span class="line">choco config set --name="'centralManagementServiceUrl'" --value="'https://$($hostname):24020/ChocolateyManagementService'"</span><span class="line">choco feature enable --name="'useChocolateyCentralManagement'"</span></code></pre>

@snapend

+++

## Result

Open CCM Web UI and see clients checking into CCM

---

@title[Questions]
## Questions?

Feel free to get in touch after the workshop.

Email: gary@chocolatey.io / paul@chocolatey.io

Twitter: @gep13 / @pauby

Web: https://chocolatey.org

---

@title[Resources]
## Resources

* Chocolatey Documentation - https://chocolatey.org/docs
* Gitter Chat - https://gitter.im/chocolatey/choco
* Google Groups - https://groups.google.com/forum/#!forum/chocolatey
* Learning Resources - https://chocolatey.org/docs/resources
