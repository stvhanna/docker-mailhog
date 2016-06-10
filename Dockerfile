FROM alpine:3.4

MAINTAINER toph <toph@toph.fr>

RUN apk add --no-cache ca-certificates openssl
RUN mkdir -p /usr/local/sbin

ENV MAILHOG_VERSION 0.2.0

RUN wget "https://github.com/mailhog/MailHog/releases/download/v$MAILHOG_VERSION/MailHog_linux_amd64" -O /usr/local/sbin/mailhog \
    && chmod a+x /usr/local/sbin/mailhog

ENV MH_API_BIND_ADDR :80
ENV MH_UI_BIND_ADDR :80
ENV MH_SMTP_BIND_ADDR :25

EXPOSE 25 80

CMD ["mailhog"]
