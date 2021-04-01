# TeamCity Agent (with PHP extensions) 

![Build Status](https://img.shields.io/travis/darkgoldblade01/teamcity-agent-php?style=for-the-badge)

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
 - php7.4-sqlite


### Recommended Laravel Testing Suite
We recommend using Apache Ant, and example [`build.xml`](https://github.com/brianclogan/teamcity-agent-php/blob/master/docs/build.xml) file is included in the docs folder.

To use in teamcity, run the `build.xml` file using the Apache Ant build step. This automatically runs all the basic tests included in the container, along with automatically downloading the `.phar` files required for extra testing that is not supported via composer.

____

## Getting Started
1. Pull image ```docker pull darkgoldblade01/teamcity-agent-php``` _optional_
2. You will need [teamcity-agent](https://hub.docker.com/r/jetbrains/teamcity-server/) to run builds. 
3. Run the container
```
docker run -itd --privileged --name=teamcity-php-1 -e SERVER_URL="http://localhost:8111"  -v <path to agent config folder>:/data/teamcity_agent/conf darkgoldblade01/teamcity-agent-php
```

## Upgrading
1. Pull the new image `docker pull darkgoldblade01/teacity-agent-php:latest`
2. Remove the old containers
3. Run the new containers
```
docker run -itd --privileged --name=teamcity-php-1 -e SERVER_URL="http://localhost:8111"  -v <path to agent config folder>:/data/teamcity_agent/conf darkgoldblade01/teamcity-agent-php
```

___
### MORE INFORMATION

This is a fork from [alekspankov/teamcity-agent-php](https://github.com/alekspankov/teamcity-agent-php), to upgrade to PHP7.4, and add in more of the core features required for Laravel testing.
