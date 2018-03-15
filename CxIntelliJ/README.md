# IntelliJ IDEA docker container for Checkmarx integration

Graphical docker container that relies on the host X11 server to show the GUI.

No special options are required to build the image: `docker build -t cxai/cxintellij .`

## Running
Allow local connections to your host's X server from the container and run the container
* Linux: `xhost +local:$(docker inspect --format='{{ .Config.Hostname }}' cxai/cxintellij)`
* Windows: `& 'C:\Program Files (x86)\Xming\xming' :0 -ac -clipboard -multiwindow`

Run:

`docker run --name intellij --rm -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro -v intellij:/root/ cxai/cxintellij`

## Setup
Start IntelliJ, go into File -> Settings and install plugin from /opt/

To change timezone add `-e "TZ=America/Los_Angeles"` to the `docker run` command

## References
* [Setting up IntelliJ Plugin](https://checkmarx.atlassian.net/wiki/spaces/KC/pages/126459215/Setting+Up+the+CxSAST+IntelliJ+Plugin+v8.4.2+and+up)
