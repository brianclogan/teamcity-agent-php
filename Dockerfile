FROM jetbrains/teamcity-agent

LABEL maintainer="blogan@collingmedia.com"
LABEL version="1.0"
LABEL description="TeamCity CI Agent with PHP7.3"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y software-properties-common \
        wget \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update -qq \
    && apt-get install -y php7.3-cli php-pear php7.3-curl php7.3-dev php7.3-gd php7.3-mbstring php7.3-zip php7.3-mysql php7.3-xml php7.3-intl php7.3-pgsql php7.3-json php7.3-xdebug\
    && rm -rf /var/lib/apt/lists/* \
    && cd ~ \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && composer global require "phpunit/phpunit ^7" \
    && ln -s ~/.composer/vendor/bin/phpunit /usr/local/bin/phpunit \
    && composer global require 'phpunit/dbunit=*' \
    && composer global require 'phpunit/php-invoker=*' \ 
    && composer global require 'phpunit/phpunit-selenium=*' \
    && composer global require phpmd/phpmd \
    && ln -s ~/.composer/vendor/bin/phpmd /usr/local/bin/phpmd \
    && composer global require pdepend/pdepend \
    && ln -s ~/.composer/vendor/bin/pdepend /usr/local/bin/pdepend \
    && cd ~ && wget https://github.com/phpDocumentor/phpDocumentor2/releases/download/v2.9.0/phpDocumentor.phar \
    && mv ~/phpDocumentor.phar /usr/bin && chmod a+x /usr/bin/phpDocumentor.phar \
    && ln -s /usr/bin/phpDocumentor.phar /usr/bin/phpdoc \
    && composer global require mayflower/php-codebrowser \
    && ln -s ~/.composer/vendor/bin/phpcb /usr/local/bin/phpcb \
    && composer global require sebastian/phpcpd \
    && ln -s ~/.composer/vendor/bin/phpcpd /usr/local/bin/phpcpd \
    && composer global require phploc/phploc \
    && ln -s ~/.composer/vendor/bin/phploc /usr/local/bin/phploc \
    && composer global require squizlabs/php_codesniffer \
    && ln -s ~/.composer/vendor/bin/phpcs /usr/local/bin/phpcs
