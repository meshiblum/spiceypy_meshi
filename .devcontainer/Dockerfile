# Use the official Ubuntu image as the base image
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    wget \
    gcc \
    make \
    zlib1g-dev

# Download and install the SPICE Toolkit
RUN wget https://naif.jpl.nasa.gov/pub/naif/toolkit/C/PC_Linux_GCC_64bit/packages/cspice.tar.Z && \
    tar -xvf cspice.tar.Z && \
    cd cspice && \
    make all && \
    make install && \
    cd ..

# Install SpiceyPy using pip
RUN pip3 install spiceypy

# Print SpiceyPy version for verification
RUN python3 -c "import spiceypy as spice; print('SpiceyPy version:', spice.tkvrsn('TOOLKIT'))"

# Set the default command to run Python 3 when the container starts
CMD ["python3"]
