# GraalVM Oracle JRE docker container

## What’s inside

This image is similar to [`eclipse-temurin`](https://hub.docker.com/_/eclipse-temurin), 
but it includes GraalVM and is built from the official `container-registry.oracle.com/graalvm/jdk`, 
specifically as a jre version.

The versions for this image are synchronized with the [GraalVM JDK versions](https://docs.oracle.com/en/graalvm/index.html).

## Usage

```
$ docker pull ghcr.io/yarosman/graalvm-oracle-jre:17.0.12
$ docker pull ghcr.io/yarosman/graalvm-oracle-jre:21.0.4
$ docker pull ghcr.io/yarosman/graalvm-oracle-jre:22.0.2
```

See all available images at https://github.com/yarosman/graalvm-jre-docker/pkgs/container/graalvm-oracle-jre

## License

- code in this repository -- see [LICENSE](LICENSE)
- pre-built container -- see https://github.com/oracle/graal#license
