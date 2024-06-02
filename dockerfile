FROM scratch

# Install alpine linux
ADD alpine-minirootfs-3.20.0-x86_64.tar.gz /
RUN ls -al

# Install dependencies for https://github.com/alpinelinux/docker-alpine/raw/v3.20/x86_64/alpine-minirootfs-3.20.0-x86_64.tar.gzRoadrunner
RUN apk update
RUN apk add curl php php-cli php-phar php-json php-openssl php-mbstring php-curl php-zip
RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet
RUN mv composer.phar /usr/local/bin/composer

# # Install roadrunner
# RUN curl --proto '=https' --tlsv1.2 -sSf \
#     https://raw.githubusercontent.com/roadrunner-server/roadrunner/master/download-latest.sh | sh

# Make sure the project directory exists
RUN mkdir -p /var/www/html
COPY ./.rr.yaml /var/www/html/
COPY ./psr-worker.php /var/www/html/

EXPOSE 8080
CMD [ "/bin/sh" ]