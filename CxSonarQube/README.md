# SonarQube docker container for Checkmarx integration

SonarQube server with the Checkmarx plugin. Based on the official docker image from [here](https://github.com/docker-library/docs/tree/master/sonarqube).
By default, the image will use an embedded H2 database that is not suited for production. To configure an external DB check the [official reference](https://github.com/docker-library/docs/tree/master/sonarqube).

No special options are required to build the image: `docker build -t cxai/cxsonarqube .`

## Running

`docker run --name sonarqube -d --rm -p 9000:9000 -p 9092:9092 -v sonarqube:/opt/sonarqube/data cxai/cxsonarqube`

## Setup

1. Login as admin/admin
2. Create a project. Click on the project, go to Administration -> Checkmarx and configure server URL/credentials. Pick the Cx project.
3. Get the [sonar scanner](https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner) for your platform
4. Create a scan token
5. Run the sonarqube scan
`sonar-scanner -Dsonar.projectKey=projectKey -Dsonar.sources=. -Dsonar.host.url=http://localhost:9000 -Dsonar.login=yourScanToken`

## References
* [Setting up the Checkmarx SonarQube Plugin](https://checkmarx.atlassian.net/wiki/spaces/KC/pages/234815626/Setting+up+the+Checkmarx+SonarQube+Plugin)
