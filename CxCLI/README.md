# Checkmarx CLI in a docker container

Latest CLI tool wrapped into a docker container. No special options are required to build the image: `docker build -t cxai/cxcli .`

## Running
To see help run

`docker run --rm cxai/cxcli`

To execute a scan with source in the current folder run

`docker run -v ${PWD}:/usr/src --net=host cxai/cxcli Scan -CxServer {server} -ProjectName {projectName} -CxUser {username} -CxPassword {password} -LocationType {location_type} -LocationPath {location_path} -LocationPathExclude "{exclude_paths}" -v`

## References
For information on the Checkmarx CLI and what options are required to run the scan see [Checkmarx Documentation](https://checkmarx.atlassian.net/wiki/display/KC/CxConsole%3A+CxSAST+CLI)
