# Use the latest Ubuntu # Use the latest Ubuntu base image
FROM ubuntu:latest

# Set the maintainer label
LABEL maintainer="Tuan Thai <tuanthai@example.com>"

# Update the package list and install necessary packages
RUN apt update -y && \
    apt install -y python3-pip python3-dev python3-venv build-essential && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Create a working directory
WORKDIR /flask_app

# Copy the current directory contents into the container
ADD . /flask_app

# Create a virtual environment
RUN python3 -m venv venv

# Install the requirements in the virtual environment
RUN ./venv/bin/pip install --no-cache-dir -r requirements.txt

# Set the entry point for the container
CMD ["./venv/bin/python", "app.py"]  # Adjust this to your main application file
