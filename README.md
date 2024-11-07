# GraalVM Oracle JRE docker container

## What’s inside

This image is similar to [`eclipse-temurin`](https://hub.docker.com/_/eclipse-temurin), 
but it includes GraalVM and is built from the official [`container-registry.oracle.com/graalvm/jdk`](https://container-registry.oracle.com/ords/f?p=113:4:5149563672333:::4:P4_REPOSITORY,AI_REPOSITORY,AI_REPOSITORY_NAME,P4_REPOSITORY_NAME,P4_EULA_ID,P4_BUSINESS_AREA_ID:2203,2203,Oracle%20GraalVM%20JDK%20without%20Native%20Image%20released%20under%20GFTC,Oracle%20GraalVM%20JDK%20without%20Native%20Image%20released%20under%20GFTC,1,0&cs=3ll5hI4CkbQyX1eI8RxI_JCtD3dIpjQ7NXzEIj9VpvkZ_VRNYK9Ki039peiNVZBWhVfpmFcXU4QmqM88P7vmLoA), 
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
