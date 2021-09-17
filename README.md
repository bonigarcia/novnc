[![](https://img.shields.io/docker/pulls/bonigarcia/novnc?style=flat-square)](https://hub.docker.com/r/bonigarcia/novnc)
[![](https://img.shields.io/docker/cloud/build/bonigarcia/novnc?style=flat-square)]()
[![License badge](https://img.shields.io/badge/license-Apache2-green.svg)](https://www.apache.org/licenses/LICENSE-2.0)
[![Twitter Follow](https://img.shields.io/twitter/follow/boni_gg.svg?style=social)](https://twitter.com/boni_gg)

# noVNC Docker image

Standalone noVNC client based on Alpine (available on [Docker Hub]). It allows to autoconnect to the VNC server, pass the VNC password, and set view-only mode usin environment variables.

## Example

The following example use Chrome in Docker (image created and maintained by [Aerokube]) which starts a VNC server:

1. Start Docker container with VNC server:
```
docker run --rm --cap-add=SYS_ADMIN -p 4444:4444 -p 5900:5900 -e ENABLE_VNC=true selenoid/vnc:chrome_91.0
```

2. Start Docker container with noVNC:
```
docker run --rm --name novnc -p 6080:6080 -e AUTOCONNECT=true -e VNC_PASSWORD=selenoid -e VNC_SERVER=172.17.0.1:5900 -e VIEW_ONLY=false bonigarcia/novnc:1.1.0
```

3. Connect to: http://localhost:6080/


This approach is used in [WebDriverManager].

## About

bonigarcia/novnc (Copyright &copy; 2021) is an open-source project created and maintained by [Boni García], licensed under the terms of [Apache 2.0 License].

[Apache 2.0 License]: https://www.apache.org/licenses/LICENSE-2.0
[Boni García]: https://bonigarcia.dev/
[WebDriverManager]: https://bonigarcia.dev/webdrivermanager/
[Aerokube]: https://aerokube.com/selenoid/latest/
[Docker Hub]: https://hub.docker.com/r/bonigarcia/novnc
