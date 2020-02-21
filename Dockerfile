FROM jetbrains/teamcity-agent
LABEL maintainer="me@darkgoldblade01.com"
LABEL version="1.1"
LABEL description="TeamCity CI Agent with PHP7.4"
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get install -y software-properties-common wget zip \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update -qq \
    # Install NodeJS
    && apt-get install -y nodejs \
    # Install PHP7.4
    && apt-get install -y php7.4-cli php-pear php7.4-curl php7.4-dev php7.4-gd php7.4-mbstring php7.4-zip php7.4-mysql php7.4-xml php7.4-intl php7.4-pgsql php7.4-json php7.4-imagick php7.4-xdebug\
    && rm -rf /var/lib/apt/lists/* \
    && cd ~ \
    # Install Composer
    && wget -q https://getcomposer.org/composer-stable.phar \
    && mv ~/composer-stable.phar /usr/bin && chmod a+x /usr/bin/composer-stable.phar \
    && ln -s /usr/bin/composer-stable.phar /usr/bin/composer \
    # Install phpDocumentor (3.0.0-rc)
    && wget -q https://github.com/phpDocumentor/phpDocumentor/releases/download/v3.0.0-rc/phpDocumentor.phar \
    && mv ~/phpDocumentor.phar /usr/bin && chmod a+x /usr/bin/phpDocumentor.phar \
    # Composer Global Require Everything...
    && composer global require 'phpunit/phpunit=^7' 'phpunit/php-code-coverage=^6' 'phpmd/phpmd=^2.8' 'pdepend/pdepend=^2.7' 'sebastian/phpcpd=^4.1' 'phploc/phploc=^5.0' 'squizlabs/php_codesniffer=^3.5' \
    # System Links for DAYSSSSSS
    && ln -s /usr/bin/phpDocumentor.phar /usr/bin/phpdoc \
    && ln -s ~/.composer/vendor/bin/phpunit /usr/local/bin/phpunit \
    && ln -s ~/.composer/vendor/bin/phpmd /usr/local/bin/phpmd \
    && ln -s ~/.composer/vendor/bin/pdepend /usr/local/bin/pdepend \
    && ln -s ~/.composer/vendor/bin/phpcpd /usr/local/bin/phpcpd \
    && ln -s ~/.composer/vendor/bin/phploc /usr/local/bin/phploc \
    && ln -s ~/.composer/vendor/bin/phpcs /usr/local/bin/phpcs \
    # Finally, install NPM
    && apt-get update \
    && apt-get install -y npm