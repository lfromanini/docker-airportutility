<img align="right" src="https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg">

# docker-airportutility

A very strange way to give a web interface to Apple Airport Utility, but also an easy way to configure your device when using Linux.
It will be running on top of [Wine](https://www.winehq.org/) in a lightweight dockerized [Alpine Linux](https://www.alpinelinux.org/) 32 bits. The presentation layer is provided by [noVNC](https://novnc.com/).

```
                    _            _             
                 __| | ___   ___| | _____ _ __ 
                / _` |/ _ \ / __| |/ / _ \ '__|
               | (_| | (_) | (__|   <  __/ |   
                \__,_|\___/ \___|_|\_\___|_|   
               
       _                       _           _   _ _ _ _         
  __ _(_)_ __ _ __   ___  _ __| |_   _   _| |_(_) (_) |_ _   _ 
 / _` | | '__| '_ \ / _ \| '__| __| | | | | __| | | | __| | | |
| (_| | | |  | |_) | (_) | |  | |_  | |_| | |_| | | | |_| |_| |
 \__,_|_|_|  | .__/ \___/|_|   \__|  \__,_|\__|_|_|_|\__|\__, |
             |_|                                         |___/ 

```

![docker-airportutility](images/docker-airportutility.png?raw=true "docker-airportutility")

## Running

1. Pull it from [docker hub](https://hub.docker.com/r/lfromanini/airportutility) and run it:

```bash
docker run -d --name airportutility -p 8080:8080 lfromanini/airportutility
```

2. Navigate to [http://localhost:8080/vnc_lite.html](http://localhost:8080/vnc_lite.html) or replace `localhost` with your docker server IP address and follow on screen instructions to install the application inside your container (next, next, finish).
After installation is done, Airport Utility will be automatically loaded. In case of crashs, it will be automatically reloaded.

```bash
xdg-open http://localhost:8080/vnc_lite.html
```

## Building from sources

Build it from sources:

```bash
git clone https://github.com/lfromanini/docker-airportutility.git
docker build -t lfromanini/airportutility .
```

#### Requirements

* [docker](https://www.docker.com/)
* [git](https://git-scm.com/)
