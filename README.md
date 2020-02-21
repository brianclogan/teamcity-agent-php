# TeamCity Agent (with PHP extensions) 

Marvellous [TeamCity Server](https://jetbrains.ru/products/teamcity/) with PHP CI Tools (see below). This build is based on [official TeamCity Agent Docker build](https://hub.docker.com/r/jetbrains/teamcity-agent/). 

## PHP Setup
Has the base install of everything required for basic PHP testing out of the box. Need to add something? Submit a pull request!

 - php7.4-cli 
 - php-pear 
 - php7.4-curl 
 - php7.4-dev 
 - php7.4-gd 
 - php7.4-mbstring 
 - php7.4-zip 
 - php7.4-mysql 
 - php7.4-xml 
 - php7.4-intl 
 - php7.4-pgsql 
 - php7.4-json 
 - php7.4-imagick
 - php7.4-xdebug

## Testing Setup
All testing tools are included via composer, aside from phpDocumentor which is downloaded via the `.phar` file in the latest release candidate.

 - phpunit/phpunit ^7 (https://phpunit.de/)
 - phpmd/phpmd ^2.8 (https://github.com/phpmd/phpmd)
 - pdepend/pdepend ^2.7 (https://github.com/pdepend/pdepend)
 - sebastian/phpcpd ^4.1 (https://github.com/sebastianbergmann/phpcpd)
 - phploc/phploc ^5.0 (https://github.com/sebastianbergmann/phploc)
 - squizlabs/php_codesniffer ^3.5 (https://github.com/squizlabs/PHP_CodeSniffer)
 - phpdocumentor/phpdocumentor 3.0.0-rc (https://www.phpdoc.org/)

## Getting Started

1. Pull image ```docker pull darkgoldblade01/teamcity-agent-php``` _optional_
1. You will need [teamcity-agent](https://hub.docker.com/r/jetbrains/teamcity-server/) to run builds. 
1. Run 
```
docker run -itd --privileged --name=teamcity-php-1 -e SERVER_URL="http://localhost:8111"  -v <path to agent config folder>:/data/teamcity_agent/conf darkgoldblade01/teamcity-agent-php
```


### MORE INFORMATION

This is a fork from [alekspankov/teamcity-agent-php](https://github.com/alekspankov/teamcity-agent-php), to upgrade to PHP7.3, and add in more of the core features required for Laravel testing.
