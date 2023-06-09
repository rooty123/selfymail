# Selfymail

Launching self mail hosting has always been a pain in the ass. Generally you need VPS or similar host and pay for it. Besides you need to set up and manage all antispam services to prevent you from being spammed. 

The aim of Selfymail is to make running self hosted mail as easy as possible.

### Architecture

![](Selfymail.drawio.png)


Under the hood selfymail uses great [Maddy mail server](https://maddy.email/) which is written in Go and includes SMTP/POP3/IMAP in one single binary with low usage footprint.

### Requirements

* Domain name and access to DNS zone editing
* Docker with docker compose module
* Telegram account to access [@selfymailbot](https://t.me/selfymailbot)
* (optional) AWS SES, sendgrid of something similar if you want to send email and be sure it is delivered well

### Installation

* Clone this repository
* Access telegram bot [@selfymailbot](https://t.me/selfymailbot) to get the WG config. You need to set correct MX record during this step
* Wait to be approved (usually it takes up to several hours, but automation is in TODO)
* Save `wg0.conf` to `wg/wg0.conf`
* Run `./selfymail.sh` and answer a few questions. Docker compose will be launched. Self-singed certificates will be issued.

### Usage

##### Create email boxes

run `./addmbox.sh some@mailbox.com`

##### Setup email client
Since currently selfymail comes without webmail (but it is in TODO) you have to set up email client to use you new mailserver.
Use localhost:993 for imap and localhost:587 for email smtp port. If client is remote you have to define valid IP address.

Many email clients will warn you about untrusted certificates, this is normal and made for simplicity. You can issue Let's encrypt certs if you want.

If you use wireguard (default), then your mail server has IP  192.168.X.2 and you can use it in remote email clients in the same wireguard network. 
You can download wireguard config for up to 10 your secondary devices using telegram bot.


[!["Buy Me A Coffee"](https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png)](https://www.buymeacoffee.com/rooty)

Made with love and ChatGPT=)