# Use a base image with Java installed
FROM openjdk:11-slim

# Set environment variables for SonarScanner version and download URL
ENV SONAR_SCANNER_VERSION=5.0.1.3006
ENV SONAR_SCANNER_URL=https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip

# Install required tools (curl, unzip)
RUN apt-get update && \
    apt-get install -y curl unzip && \
    rm -rf /var/lib/apt/lists/*

# Download and extract Sonar Scanner
RUN curl -SL "$SONAR_SCANNER_URL" -o sonar-scanner-cli.zip && \
    unzip sonar-scanner-cli.zip -d /opt && \
    rm sonar-scanner-cli.zip && \
    ln -s /opt/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin/sonar-scanner /usr/local/bin/sonar-scanner

# Set up PATH environment variable to include Sonar Scanner
ENV PATH="${PATH}:/opt/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin"

# Print Sonar Scanner version for verification
RUN sonar-scanner -v

# Define a work directory
WORKDIR /app


# https://chat.openai.com/c/8e7c24da-0fff-4e07-b834-79535b5e80e3