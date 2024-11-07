# GraalVM Oracle JRE docker container

## What’s inside

This image is similar to [`eclipse-temurin`](https://hub.docker.com/_/eclipse-temurin), 
but it includes GraalVM and is built from the official [`container-registry.oracle.com/graalvm/jdk`](https://container-registry.oracle.com/ords/f?p=113:4:5149563672333:::4:P4_REPOSITORY,AI_REPOSITORY,AI_REPOSITORY_NAME,P4_REPOSITORY_NAME,P4_EULA_ID,P4_BUSINESS_AREA_ID:583,583,Oracle%20Java%20Development%20Kit%20(JDK),Oracle%20Java%20Development%20Kit%20(JDK),1,0&cs=3TUqusHbp1peqYp9TOx5uvgjhnCiCAZ_FQSQLi08Kqun6l7YUiFffK1kdboG3rHL8ggMYXXhjkqRIoHyOnyKuJA), 
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
