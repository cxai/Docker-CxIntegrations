# Jenkins docker container with integrated Checkmarx plugin

Preconfigured latest Jenkins with the latest CxSAST plugin. No setup is needed, use admin/admin to login.
This docker container is based off jenkins/jenkins:lts image in its default configuration with checkmarx:latest plugin installed. Latest default recommended plugins are also installed (see plugins.txt).

No special options are required to build the image: `docker build -t cxai/cxjenkins .`

## Running
`docker run --name jenkins --rm -p 8081:8080 -v jenkins:/var/jenkins_home cxai/cxjenkins`

## Setup
1. Connect to Jenkins on http://localhost:8081, click "manage jenkins" -> "configure system". Under "Checkmarx" specify the default server URL and the credentials. Test and save configuration.
2. Create a new build. Back in the main menu, click "new item", enter name and select "freestyle project". Then configure it by selecting a git repository under "source code management" and enter a Checkmarx project name under "build - CxSAST Scan"
3. Execute the build - click "build now" in the menu
4. Results will be on the main builder

## Notes
* Add the following to /var/jenkins_home/config.xml to configure default security

```
<disabledAgentProtocols>
  <string>CLI-connect</string>
  <string>CLI2-connect</string>
  <string>JNLP-connect</string>
  <string>JNLP2-connect</string>
</disabledAgentProtocols>
<label></label>
<crumbIssuer class="hudson.security.csrf.DefaultCrumbIssuer">
  <excludeClientIPFromCrumb>false</excludeClientIPFromCrumb>
</crumbIssuer>
```

* Configuration settings for the Checkmarx plugin are stored in ``/var/lib/docker/volumes/jenkins/_data/com.checkmarx.jenkins.CxScanBuilder.xml`

## References
* [Base Jenkins dockerfiles](https://github.com/jenkinsci/docker)
* [Checkmarx plugin manual](https://checkmarx.atlassian.net/wiki/spaces/KC/pages/224886988/Setting+Up+and+Configuring+the+Jenkins+Plugin+v8.6.0+and+up)
