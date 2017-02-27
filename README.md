# lab-devops-security
This repo is for the lab for the NYU class on DevOps and Security

Follow the steps below to get the lab code and see how to deploy manually.

## Prerequisite Installation using Vagrant
The easiest way to use this lab is with Vagrant and VirtualBox. if you don't have this software the first step is down download and install [VirtualBox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/)

## Get the lab code
From a terminal navigate to a location where you want this application code to be downloaded to and issue:
```bash
    $ git clone https://github.com/nyu-devops/lab-devops-security.git
    $ cd lab-devops-security
    $ vagrant up
```
This will create a vm running Headless ZAP 2.5 in a Docker container on port 8080 and The BodgeIt Store in a container on port 32768

You can reach the ZAP URL at:

    http://localhost:8080/

You can reach the The BodgeIt Store URL at:

    http://localhost:32768/

You will still need to download the Desktop ZAP Tool at:

    https://github.com/zaproxy/zaproxy/wiki/Downloads

Please download these before coming to class to conserve bandwidth on the day of the class.
