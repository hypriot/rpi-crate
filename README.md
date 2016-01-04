# rpi-crate

Raspberry Pi compatible Docker Image with [Crate.io](https://crate.io)

Based upon original repo https://github.com/crate/docker-crate

Run all the commands from within the project root directory.

### Build Details
- [Source Project Page](https://github.com/hypriot)
- [Source Repository](https://github.com/hypriot/rpi-crate)
- [Dockerfile](https://github.com/hypriot/rpi-crate/blob/master/Dockerfile)
- [DockerHub](https://hub.docker.com/u/hypriot/rpi-crate/)


#### Build the Docker Image
```bash
make build
```

#### Run the Docker Image and get the version of the installed Crate.io
```bash
make version
```

#### Push the Docker Image to the Docker Hub
* First use a `docker login` with username, password and email address
* Second push the Docker Image to the official Docker Hub

```bash
make push
```

#### Run a single Crate.io database instance
```bash
make run1
```

#### Open admin web page
```
open http://<ipaddress>:4200/admin
```

#### Run two Crate.io database instance
```bash
make run2
```



