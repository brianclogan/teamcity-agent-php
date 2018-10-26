# TeamCity (with PHP extensions) 

Marvellous [TeamCity Server](https://jetbrains.ru/products/teamcity/) with PHP CI Tools (see below). This build is based on [official TeamCity Agent Docker build](https://hub.docker.com/r/jetbrains/teamcity-agent/). 

## PHP Tools included

1. PHP 7.2 CLI
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

1. Pull image ```docker pull aleksxp/teamcity-agent-php``` _optional_
1. You will need [teamcity-agent](https://hub.docker.com/r/jetbrains/teamcity-server/) to run builds. 
1. Run ```docker run -it -e SERVER_URL="<url to TeamCity server>"  \ 
    -v <path to agent config folder>:/data/teamcity_agent/conf  \      
    aleksxp/teamcity-agent-php``

Read more about **docker run** option in [official Docker documentstion](https://docs.docker.com/engine/reference/run/). 
Also you can use the documentation for official [TeamCity agent image](https://hub.docker.com/r/jetbrains/teamcity-agent/)

## Documentation 

The full documentation is placed on [project site](https://alekspankov.github.io/teamcity-agent-php/).

## Build
1. Create directory
1. CD into created directory
1. Create Dockerfile. Use ```FROM aleksxp/teamcity-php```. Add whatever you need. 
1. Run ```docker build -t your_image_name .```

Read more about **Dockerfile** and **docker build** in  [official Docker documentation](https://docs.docker.com/engine/reference/builder/).

### Prerequisites

1. [Docker](https://docs.docker.com/engine/installation/)


## Authors

* **Alexander Pankov** <ap@wdevs.ru>

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
