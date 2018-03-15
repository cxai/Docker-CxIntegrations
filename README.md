# Docker images preconfigured for Checkmarx SAST

Containerized versions of various CI/CD tools that Checkmarx can integrate with. Here you can find sources for the Cx integration images available for download off docker hub. If you are looking for the container based version of Checkmarx SAST itself look [here](https://github.com/alexivkin/Docker-CxCore).

All images are built with freely available software, which is licensed under open source or proprietary free and trial licenses.

Containers marked as GUI require X11 server on the host. See individual README files for more details.

* Jenkins: [source](CxJenkins/README.md), [image](https://hub.docker.com/r/cxai/cxjenkins/)
* Jira: [source](CxJira/README.md), [image](https://hub.docker.com/r/cxai/cxjira/)
* IntelliJ (GUI): [source](CxIntelliJ/README.md), [image](https://hub.docker.com/r/cxai/cxintellij/)
* Checkmarx CLI: [source](CxCLI/README.md), [image](https://hub.docker.com/r/cxai/cxcli/)
* Eclipse (GUI)
* Ant
* Maven
* Threadfix
* Bamboo
* TeamCity
* SonarQube
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

## X11 Alternative
In order to show Linux GUI apps without installing a windows version of an X org server try [this alternative](https://hub.docker.com/r/psharkey/novnc/), which serves a VNC screen over the web as an HTML5 canvas.
