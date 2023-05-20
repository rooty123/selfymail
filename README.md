# Selfymail

Launching self mail hosting has always been pain in the ass. Generaly you need VPS or similar to host and pay for it. Besides you need to set up and manage all antispam services to prevent you from being spammed. 

The aim of Selfymail is to make possible running self hosted mail as easy as possible.

### Architecture

![](Selfymail.drawio.png)


### Requirements

* domain name and access to DNS zone editing
* docker with docker compose module
* (optional) AWS SES, sendgrid of something similar if you want to send email and be sure it is delivered well

### Installation

* Clone this repository
* Access telegram bot @selfmymailbot to get the token. You need to set correct MX record during this step
* Wait to be approved (usually it takes up to several hours, but automation is in TODO)
* Run ./selfymail.sh and provide aquired token to get wireguard config. Docker compose will be launched.

### Usage

Create email boxes
Since currently selfymail comes without webmail (but it is in TODO) you have to set up email client to use you new mailserver