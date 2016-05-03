# **BetterCAP**

![BetterCap Logo](https://bettercap.org/assets/img/homepage-logo-border.png
 "")

BetterCAP is a powerful, flexible and portable tool created to perform various types of MITM attacks against a network, manipulate HTTP, HTTPS and TCP traffic in real-time, sniff for credentials and much more.

# Lightweight Container

In this repository, BetterCAP is containerized using [Alpine Linux](https://alpinelinux.org/ "") -  a security-oriented, lightweight Linux distribution based on musl libc and busybox. The resulting Docker image is relatively small and easy to manage the dependencies.

# Download

Pull latest BetterCAP version of the image:

```sh
$ docker pull gowthamsadasivam/docker-bettercap
```

Pull a specific BetterCAP version of the image: (*ex. 1.5.4*)

```sh
$ docker pull gowthamsadasivam/docker-bettercap:1.5.4
```

# Example

Access to all network interfaces of the *HOST* machine:

```sh
$ docker run -it --privileged --net=host -p 8080:8080 gowthamsadasivam/docker-bettercap:1.5.4 -T 192.168.0.3 -I wlan0 --proxy -X --no-spoofing
```

Access only within the *docker0* (bridged) interface:

```sh
$ docker run -it -p 8080:8080 gowthamsadasivam/docker-bettercap:1.5.4 -T 172.17.0.3 --proxy -X --no-spoofing
```

# Usage & Options

`-it` => Provides interactive shell, where you can see the BetterCAP output.

`--privileged` => Provides privileged user permissions to the user within the container so that BetterCAP can have access to the *HOST* machine network interfaces and *iptables*. This option is a MUST to keep BetterCAP function properly.

`--net=host` => Makes all the *HOST* machine network interfaces visible/accessible inside the Docker container.

Read more about docker options [HERE](https://docs.docker.com/engine/reference/run/ "").

`-I wlan0` => By default BetterCAP will automatically detect your network interface and use it. But in-case, if you want to make it use another interface ( when you have more than one, let’s say *eth0* and *wlan0* ) you can use this option.

`--proxy` => Enables BetterCAP in-built HTTP proxy. By default it will run the proxy in port *8080*.

`-X` => Enables BetterCAP sniffing feature.

`--no-spoofing` => A gentle way to avoid flooding the entire network in order to MiTM everyone. This keeps you look around without being too noisy or disruptive.

Read more about BetterCAP options [HERE](https://bettercap.org/docs/main.html "").
