FROM alpine:3.3

MAINTAINER toph <toph@toph.fr>

RUN apk add --no-cache ca-certificates

ENV MAILHOG_VERSION 0.1.8

RUN wget "https://github.com/mailhog/MailHog/releases/download/v$MAILHOG_VERSION/MailHog_linux_amd64" -O /MailHog \
    && chmod a+x /MailHog

EXPOSE 25 80

CMD ["/MailHog", "--ui-bind-addr=:80", "--api-bind-addr=:80", "--smtp-bind-addr=:25"]
