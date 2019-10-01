# Chocolatey Workshop - Organizational Use

This is the material for the workshop "Managing Organizational Use Of Chocolatey"
written by Gary Ewan Park and Paul Broadwith.

## Content

Software management and deployment is already a task, getting that good base of
infrastructure in place right definitely helps. When you are using Chocolatey
for software deployments, there are some recommendations on how to set up
repositories and Configuration Management, not to mention how best to set up
your production deployment infrastructure for success. Achieving reliability,
repeatability, and scale is important in any organization - come let us show you
how to easily achieve all of that.

In this workshop you will get hands on experience with:

* Setting up your workstation for Chocolatey packaging (best tools to use)
* Preparing Chocolatey for internal use
* Setting up package repositories (Nexus)
* Self Service Management of Package Installations
* Synchronizing traditionally installed applications with Chocolatey Packages
* Combining Chocolatey with Configuration Management Systems
* Complete visibility of package installations using Chocolatey Central Management

## Workshop slides

* The most recent slides for this presentation can be found here [![GitPitch](https://gitpitch.com/assets/badge.svg)](https://gitpitch.com/chocolatey/chocolatey-workshop-organizational-use/master)

## Past workshops

- This presentation was given at [WinOps 2019](https://www.winops.org/london-2019/) on 23rd September 2019
  - The slides can be found here [![GitPitch](https://gitpitch.com/assets/badge.svg)](https://gitpitch.com/chocolatey/chocolatey-workshop-organizational-use/winops2019)

## Running the workshop

* Prepare a couple of Win2016 VM's in in your favourite cloud.
* You can use the Terraform templates in the `prepare-vms` folder to create VM's
in Azure.
* Check and increase your limits two weeks before running the workshop.
* Check and ask in advance if your workshop location allows outgoing RDP
connections at port 3389.

Important notes:

* Before running the `initialize-azure.sh` script make sure you have set the default Azure subscription to use by running `az account set -s <SUBSCRIPTION ID>`;
* Make sure the `initialize-azure.sh` script has the execution bit set by running `chmod +x initialize_azure.sh`

## Problems? Questions? Feedback?

* If you have problems, find a bug or have questions, don't hesitate to contact us.
* Open an issue in this repository or send me a pull request.

Have fun!

## Thanks

This workshop would not have been possible without the amazing work of [Stefan Scherer](https://github.com/StefanScherer).  The contents of this workshop are based on the work that Stefan did in this [repository](https://github.com/StefanScherer/windows-docker-workshop), where he shows how to put together a full workshop environment using Packer, Terraform and Azure.
