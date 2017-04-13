FROM ubuntu
# Add XX-Net
# RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt-get update && apt-get install --no-install-recommends -y \
python \
python-openssl \
libffi-dev \
python-gtk2 \
python-appindicator \
libnss3-tools

# Clean apt cache
RUN apt-get clean

# Copy file to container
RUN mkdir -p /opt/XX-Net
ADD . /opt/XX-Net
RUN chmod +x /opt/XX-Net

# Commands when creating a new container
WORKDIR /opt/XX-Net/
CMD ["python", "/opt/XX-Net/proxy.py"]

EXPOSE 8087
EXPOSE 8086
VOLUME /opt/XX-Net
