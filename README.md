# MailHog docker image

Here is an unofficial Dockerfile for [MailHog][mailhog].

It is a very small image (~18 MB uncompressed) available on [docker hub][dockerhubpage] based on [Alpine Linux][alpinehubpage] and using the last available release from the official Github repo of [MailHog][mailhog].

## Changelog

- 2016-11-18 Adding new vars to easily configure the Release feature
- 2016-09-08 Upgrade MailHog from 0.2.0 to 0.2.1
- 2016-06-10 Upgrade Alpine Linux from 3.3 to 3.4
- 2016-03-30 Upgrade MailHog from 0.1.8 to 0.2.0

## Usage

Get it:

    docker pull tophfr/mailhog

Run it:

    docker run -d -p 1080:80 --name smtp tophfr/mailhog

Link it:

    docker run -d --link smtp -e SMTP_HOST=smtp --name php56 tophfr/php:5.6
    
Then you can send emails from your app and check out the web interface: http://\<your docker host\>:1080/.


If you want to send emails from your host you can map the 25 port:

    docker run -d -p 1080:80 -p 1025:25 --name mail tophfr/mailhog

then send yout emails through your docker host on port 1025 (or any port you want)

## Build

Just clone this repo and run:

    docker build -t tophfr/mailhog .


  [mailhog]: https://github.com/mailhog/MailHog/ "Web and API based SMTP testing" 
  [dockerhubpage]: https://hub.docker.com/r/tophfr/mailhog/ "MailHog docker hub page"
  [alpinehubpage]: https://hub.docker.com/_/alpine/ "A minimal Docker image based on Alpine Linux with a complete package index and only 5 MB in size!"
