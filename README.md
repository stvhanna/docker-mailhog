# mailhog docker image

Here is an unofficial Dockerfile for [mailhog][mailhog].

You can find several versions of this image in [the dedicated docker hub page][dockerhubpage].  
It is a pretty light image: ~ 35 MB uncompressed.

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
