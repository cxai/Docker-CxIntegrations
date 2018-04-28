# Eclipse Oxygen docker container for Checkmarx integration

Eclipse Oxygen IDE with the Checkmarx plugin. This is a GUI docker container that relies on the host X11 server to show the interface.

No special options are required to build the image: `docker build -t cxai/cxeclipse .`

## Running
Allow local connections to your host's X server from the container and run the container
* Linux: `xhost +local:`
* Windows: `& 'C:\Program Files (x86)\Xming\xming' :0 -ac -clipboard -multiwindow`

Run:

`docker run --name eclipse --rm -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro -v eclipse:/home/developer/ cxai/cxeclipse`

## Setup
* Start Eclipse, go into File -> Import -> Git/Project from Git -> Clone URI and pull sources for a demo app. Import as a new general project because of [this bug](https://bugs.eclipse.org/bugs/show_bug.cgi?id=324145)
* Configure CxPlugin in Window -> Preferences -> CxViewer Preferences -> Authentication
* Submit a scan by right clicking on the project

To change timezone add `-e "TZ=America/Los_Angeles"` to the `docker run` command

## References
* [Setting up Eclipse Plugin](https://checkmarx.atlassian.net/wiki/spaces/KC/pages/450691572/Setting+Up+the+CxSAST+Eclipse+Plugin+on+Linux+v8.4.2+and+up)
