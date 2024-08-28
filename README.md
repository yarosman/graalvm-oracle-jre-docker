# GraalVM JRE docker container

## What’s inside

The image is similar to [`openjdk`](https://hub.docker.com/_/openjdk/) except,
of course, this one comes with Graal VM.

## Usage

Since GraalVM's binaries are on the `$PATH`, you can invoke them easily. Or build a
derived image based on this.

```
$ docker pull ghcr.io/yarosman/graalvm-jre-docker
```

See all available images at ???

## License

- code in this repository -- see [LICENSE](LICENSE)
- pre-built container -- see https://github.com/oracle/graal#license
