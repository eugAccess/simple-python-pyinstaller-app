FROM safesecurity/pytest:latest AS builder
# Create a Python virtual environment in /opt/venv.
RUN python3 -m venv /opt/venv

# Activate the virtual environment by adding its bin directory to the PATH.
# This ensures that the virtual environment is activated for all subsequent RUN commands in the Dockerfile.
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install pyinstaller
# Add the PATH environment variable to /etc/environment so that it is available to all users and processes.
RUN echo "PATH=${PATH}" >> /etc/environment