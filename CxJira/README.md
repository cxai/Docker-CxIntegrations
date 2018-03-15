# Jira docker container for Checkmarx integration

Jira Software in its out-of-the-box configuration, ready for integrating with Checkmarx.
Full setup requires an Atlassian account to get the 90 day eval license. The license can be renewed (see below).
Based off Martin Aksel Jensen's [build](https://hub.docker.com/r/cptactionhank/atlassian-jira-software/)

No special options are required to build the image: `docker build -t cxai/cxjira .`

## Running
`docker run --name jira --rm -p 8082:8080 -v jira:/var/atlassian/jira cxai/cxjira`

To change timezone add `-e "TZ=America/Los_Angeles"`

## Setup
1. Connect to Jira on http://localhost:8082
2. Click "Set it up for me", then generate the license, set the admin user, wait until all configuration is done.
3. Go through the admin user and first project setup

Checkmarx for Jira integration:
1. Go to Management > Connection Settings > Issue Tracking Settings, and click Add Issue Tracking System
2. Edit existing or create a new project and select the "Jira docker container" under Advanced -> Issue Tracking settings

To change timezone add `-e "TZ=America/Los_Angeles"` to the `docker run` command

## Renewing the eval license
Remove the volume with `docker volume rm jira`. The next time you start you will go through the setup/licensing steps again.

## References
* [Setting up Jira integration](https://checkmarx.atlassian.net/wiki/spaces/KC/pages/19333122/Setting+Up+JIRA+Integration)
