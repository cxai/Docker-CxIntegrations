# TeamCity docker container for Checkmarx integration

TeamCity server with the Checkmarx plugin. No special options are required to build the image: `docker build -t cxai/cxteamcity .`

## Running

`docker run --name teamcity --rm -it -p 8111:8111 -v teamcity:/data/teamcity_server/datadir cxai/cxteamcity`

To see logs run with
`-v <path to logs directory>:/opt/teamcity/logs`

## Setup

1. Click on administration -> checkmarx and configure the connection
2. Configure a [scan task](https://checkmarx.atlassian.net/wiki/spaces/KC/pages/346390931/Configuring+a+Scan+Task+in+TeamCity+v8.7.0+and+up)

## References
* [Setting up TeamCity Plugin](https://checkmarx.atlassian.net/wiki/spaces/KC/pages/129658366/CxSAST+TeamCity+Plugin+v8.5.0+and+up)
