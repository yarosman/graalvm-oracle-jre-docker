# Stage 1: Build stage to create a custom JRE
# Use a build argument to dynamically specify the tag of the base image
#ARG TAG=21.0.4
ARG GRAALVM_VERSION=17.0.12
FROM container-registry.oracle.com/graalvm/jdk:${GRAALVM_VERSION} as build-stage

ARG JAVA_MAJOR_VERSION=17

# Set environment variables based on the base image's structure
ENV GRAALVM_HOME=/usr/lib64/graalvm/graalvm-java$JAVA_MAJOR_VERSION \
    JAVA_HOME=/usr/lib64/graalvm/graalvm-java$JAVA_MAJOR_VERSION \
    PATH="$JAVA_HOME/bin:$PATH" \
    LD_LIBRARY_PATH="$JAVA_HOME/lib/server:$LD_LIBRARY_PATH"

RUN microdnf install -y binutils && microdnf clean all

# Verify that the jlink tool exists
RUN echo "Using GraalVM with tag: $GRAALVM_VERSION ($JAVA_MAJOR_VERSION)" && \
    echo "Checking jlink tool availability:" && \
    ls -l $JAVA_HOME/bin/jlink && \
    $JAVA_HOME/bin/java -version


# Create a custom JRE using jlink
RUN $JAVA_HOME/bin/jlink \
    --module-path $JAVA_HOME/jmods \
    --add-modules java.instrument,java.base,java.compiler,java.datatransfer,java.desktop,java.logging,java.management,java.naming,java.net.http,java.rmi,java.scripting,java.security.jgss,java.security.sasl,java.sql,java.transaction.xa,java.xml,jdk.httpserver,jdk.jfr,jdk.management,jdk.unsupported \
    --output /opt/java-runtime \
    --strip-debug \
    --no-man-pages \
    --no-header-files

# Stage 2: Final minimal runtime image
FROM debian:bullseye-slim

# Install essential runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    libstdc++6 \
    zlib1g \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libxtst6 \
    libxi6 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the custom JRE from the build stage
COPY --from=build-stage /opt/java-runtime /opt/java-runtime

# Set environment variables to use the custom JRE
ENV JAVA_HOME=/opt/java-runtime \
    PATH="/opt/java-runtime/bin:${PATH}" \
    LD_LIBRARY_PATH="/opt/java-runtime/lib/server:$LD_LIBRARY_PATH"

# Verify the custom JRE
RUN java -version

# Define the default entrypoint
ENTRYPOINT ["/bin/bash"]
