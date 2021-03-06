FROM chenjr0719/ubuntu-mate-novnc

# Install System Dependencies
RUN apt-get update && \
  apt-get install -y xterm software-properties-common python-pip && \
  add-apt-repository ppa:ubuntugis/ubuntugis-unstable && \
  apt-get update && \
  apt-get install -y httpie grass grass-dev && \
  apt-get autoclean && \
  apt-get autoremove && \
  rm -rf /var/lib/apt/lists/*

USER ubuntu
WORKDIR /home/ubuntu
COPY requirements.txt requirements.txt

# Install Python Dependencies
RUN pip install -r requirements.txt

# Create a fake location to start grass in so I can install global extensions 
RUN mkdir -p grassdata && grass -c epsg:4326 grassdata/Penaguila

# Install Grass Dependencies
RUN echo g.extension extension=r.landscape.evol | grass grassdata/Penaguila/PERMANENT

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

USER root
WORKDIR /shared
