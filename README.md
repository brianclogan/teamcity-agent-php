# TeamCity Agent (with PHP extensions) 

Marvellous [TeamCity Server](https://jetbrains.ru/products/teamcity/) with PHP CI Tools (see below). This build is based on [official TeamCity Agent Docker build](https://hub.docker.com/r/jetbrains/teamcity-agent/). 

## PHP Tools included

1. PHP 7.3 CLI
1. PHPUnit version 7 (https://phpunit.de/)
    1. db-unit (https://github.com/sebastianbergmann/dbunit)
    1. php-invoker (https://github.com/sebastianbergmann/php-invoker)
    1. phpunit-selenium (https://github.com/giorgiosironi/phpunit-selenium)
1. PHP Dead Code Detector (https://github.com/sebastianbergmann/phpdcd) _(abandoned, for backward compatibility only)_
1. PHPMD (https://github.com/phpmd/phpmd)
1. PHP_Depend (https://github.com/pdepend/pdepend)
1. PHP Documentor (https://www.phpdoc.org/)
1. PHP_CodeBrowser (https://github.com/mayflower/PHP_CodeBrowser)
1. PHPLoc (https://github.com/sebastianbergmann/phploc)
1. PHP_CodeSniffer (https://github.com/squizlabs/PHP_CodeSniffer)

## Getting Started

1. Pull image ```docker pull darkgoldblade01/teamcity-agent-php``` _optional_
1. You will need [teamcity-agent](https://hub.docker.com/r/jetbrains/teamcity-server/) to run builds. 
1. Run 
```
docker run -itd --privileged --name=teamcity-php-1 -e SERVER_URL="http://localhost:8111"  \ 
    -v <path to agent config folder>:/data/teamcity_agent/conf  \      
    darkgoldblade01/teamcity-agent-php
```


### MORE INFORMATION

This is a fork from [alekspankov/teamcity-agent-php](https://github.com/alekspankov/teamcity-agent-php), to upgrade to PHP7.3, and add in more of the core features required for Laravel testing.
