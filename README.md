# Docker images preconfigured for Checkmarx SAST

Containerized versions of various CI/CD tools that Checkmarx can integrate with. Here you can find sources for the Cx integration images available for download off docker hub. If you are looking for the container based version of Checkmarx SAST itself look [here](https://github.com/cxai/Docker-CxCore)(private repo, you'll get 404 if you are not authorized).

All images are built with freely available software, which is licensed under open source or proprietary free and trial licenses.

You can see all the images listed on the [Docker Hub](https://hub.docker.com/r/cxai/).

Containers marked as GUI require X11 server on the host. See individual README files for more details.

* Jenkins: [dockerfile](https://github.com/cxai/Docker-CxIntegrations/tree/master/CxJenkins), [image](https://hub.docker.com/r/cxai/cxjenkins/)
* Jira: [dockerfile](https://github.com/cxai/Docker-CxIntegrations/tree/master/CxJira), [image](https://hub.docker.com/r/cxai/cxjira/)
* IntelliJ (GUI): [dockerfile](https://github.com/cxai/Docker-CxIntegrations/tree/master/CxIntelliJ), [image](https://hub.docker.com/r/cxai/cxintellij/)
* Checkmarx CLI: [dockerfile](https://github.com/cxai/Docker-CxIntegrations/tree/master/CxCLI), [image](https://hub.docker.com/r/cxai/cxcli/)
* Eclipse (GUI): [dockerfile](https://github.com/cxai/Docker-CxIntegrations/tree/master/CxEclipse), [image](https://hub.docker.com/r/cxai/cxeclipse/)
* TeamCity [dockerfile](https://github.com/cxai/Docker-CxIntegrations/tree/master/CxTeamCity), [image](https://hub.docker.com/r/cxai/cxteamcity/)
* SonarQube [dockerfile](https://github.com/cxai/Docker-CxIntegrations/tree/master/CxSonarQube), [image](https://hub.docker.com/r/cxai/cxsonarqube/)
* Ant
* Maven
* Threadfix
* Bamboo
* TFS
* LDAP
* SAML IdP

## Integrations not currently suited for containers
Windows GUI applications:
* Visual Studio: [reference](https://checkmarx.atlassian.net/wiki/spaces/KC/pages/126463827/Setting+Up+the+CxSAST+Visual+Studio+Plugin+v8.4.1+and+up)
* CxAudit

Cloud based services:
* MS-VSTS
* WhiteSource

# Setup

* On Linux just run the supplied `run` script
* On Windows get a X11 server like vcxsrv, start it and run the docker container with DISPLAY exported out:
```
start "X11" "C:\Program Files\VcXsrv\vcxsrv.exe" :0 -ac -clipboard -multiwindow -silent-dup-error
start "IntelliJ" cmd.exe @cmd /k "docker run --name intellij --rm -it -e DISPLAY=$THIS_VM:0 -v intellij:/root/ cxai/cxintellij"
```

## Alternative to X11 windows server
In order to show Linux GUI apps without installing a windows version of an X org server try [this alternative](https://hub.docker.com/r/psharkey/novnc/), which serves a VNC screen over the web as an HTML5 canvas.
You can also try [x11-bridge container](https://hub.docker.com/r/jare/x11-bridge/)
