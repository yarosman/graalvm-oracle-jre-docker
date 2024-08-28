# Stage 1: Build stage to create a custom JRE
# Use a build argument to dynamically specify the tag of the base image
#ARG TAG=21.0.4
ARG GRAALVM_VERSION=22.0.1-ol9-20240504
FROM container-registry.oracle.com/graalvm/jdk:${GRAALVM_VERSION} as build-stage

ARG JAVA_MAJOR_VERSION=22

# Use ENV to persist the variable across stages

# Set environment variables based on the base image's structure
ENV GRAALVM_HOME=/usr/lib64/graalvm/graalvm-java$JAVA_MAJOR_VERSION \
    JAVA_HOME=/usr/lib64/graalvm/graalvm-java$JAVA_MAJOR_VERSION \
    PATH="$JAVA_HOME/bin:$PATH"

RUN microdnf install -y binutils && microdnf clean all

# Verify that the jlink tool exists
RUN echo "Using GraalVM with tag: $GRAALVM_VERSION ($JAVA_MAJOR_VERSION)" && \
    echo "Checking jlink tool availability:" && \
    ls -l $JAVA_HOME/bin/jlink && \
    $JAVA_HOME/bin/java -version

# Create a custom JRE using jlink
RUN $JAVA_HOME/bin/jlink \
    --module-path $JAVA_HOME/jmods \
    --add-modules java.base,java.logging,java.xml,java.sql \
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
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the custom JRE from the build stage
COPY --from=build-stage /opt/java-runtime /opt/java-runtime

# Set environment variables to use the custom JRE
ENV JAVA_HOME=/opt/java-runtime \
    PATH="/opt/java-runtime/bin:${PATH}"

# Verify the custom JRE
RUN java -version

# Define the default entrypoint
ENTRYPOINT ["/bin/bash"]
