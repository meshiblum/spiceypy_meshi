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

# Download and install the SPICE Toolkit
RUN wget https://naif.jpl.nasa.gov/pub/naif/toolkit/C/PC_Linux_GCC_64bit/packages/cspice.tar.Z && \
    tar -xvf cspice.tar.Z && \
    cd cspice && \
    make all && \
    make install && \
    cd ..

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
