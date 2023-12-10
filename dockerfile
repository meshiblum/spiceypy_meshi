# Use the official Ubuntu image as the base image
FROM ubuntu:latest

# Set non-interactive mode during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install necessary dependencies
RUN apt-get update -y && \
    apt-get install -y \
    python3 \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install SpiceyPy using pip
RUN pip3 install spiceypy

# Set environment variables
ENV SPICE_DIR=/usr/local/share/spice
ENV PATH="${SPICE_DIR}/cspice:${PATH}"

# Create a directory to work in
WORKDIR /app

# Copy your application code into the container (if applicable)
# COPY . .

# Set the default command to run when the container starts
CMD ["bash"]
