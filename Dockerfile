# Use latest Ubuntu LTS
FROM ubuntu:22.04

# Set noninteractive for apt
ENV DEBIAN_FRONTEND=noninteractive

# Update and install basic tools
RUN apt-get update && \
    apt-get install -y \
        sudo \
        curl \
        wget \
        git \
        vim \
        net-tools \
        iproute2 \
        openssh-client \
        python3 \
        python3-pip \
        bash-completion \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -ms /bin/bash ubuntuuser && \
    echo "ubuntuuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to non-root
USER ubuntuuser
WORKDIR /home/ubuntuuser

# Default command
CMD ["/bin/bash"]
