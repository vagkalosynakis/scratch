# Basic PHP image `FROM scratch`

### Building base image

1. Use the `scratch` [base image](https://hub.docker.com/_/scratch)
2. Download a minimal Linux distro. (I chose alpine minirootfs at 3.8mb)
    1. Visit the [alpinelinux repo](https://github.com/alpinelinux/docker-alpine)
    2. Switch to the [branch for the latest version](https://github.com/alpinelinux/docker-alpine/tree/v3.20) (3.20 at the moment)
    3. Download the [tarball](https://github.com/alpinelinux/docker-alpine/raw/v3.20/x86_64/alpine-minirootfs-3.20.0-x86_64.tar.gz)
    4. Place it in the project directory <span style='color:red;'>*</span>
3. Use the [`ADD` command](https://docs.docker.com/reference/dockerfile/#add) to extract the tarball inside the image
4. Instruct the image to start an `sh` shell when it's starting

<div style='color:red;'><b>Note:</b> using the ADD command with the remote url does NOT create a working image. Shell is missing. Download the file locally first.</div>

```
FROM scratch
ADD alpine-minirootfs-3.20.0-x86_64.tar.gz /
CMD [ "/bin/sh" ]
```

