# Compile stage
FROM ubuntu:20.04

# Set interactive for build
ARG DEBIAN_FRONTEND=noninteractive

# Update
RUN apt-get update
RUN apt-get -y upgrade

# Install Python
RUN apt-get -y install --no-install-recommends python3.9 python3.9-dev python3-pip
RUN python3.9 -m pip install --upgrade pip

# Install python packages
COPY requirements.txt .
COPY fastell4py-0.1.0-cp39-cp39-linux_x86_64.whl .
RUN python3.9 -m pip install --user --no-cache-dir six
RUN python3.9 -m pip install --user --no-cache-dir -r requirements.txt
RUN python3.9 -m pip install --user fastell4py-0.1.0-cp39-cp39-linux_x86_64.whl

# Install fastell4py fortran dependency
RUN apt-get -y install --no-install-recommends libgfortran5

# Copy in project files
COPY Simple_Substructure/. .

# Default launch command
CMD ["python3.9", "main.py"]

