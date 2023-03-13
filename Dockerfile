FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive
ARG WORKDIR_BASE=/var/waps/netflow
ARG WORKDIR=/var/waps/netflow/nfdump

RUN apt update

# Create the work directory
RUN mkdir -p ${WORKDIR_BASE}
WORKDIR ${WORKDIR_BASE}

RUN apt install -y \
    git \
    tree \
    make \
    libtool \
    pkg-config \
    flex \
    libbz2-dev \
    libclang-dev \
    bison \
    byacc


# Install nfdump
RUN git clone https://github.com/phaag/nfdump.git
WORKDIR ${WORKDIR}

RUN ./autogen.sh
RUN ./configure --disable-dependency-tracking
RUN /usr/bin/make --version
RUN make install
RUN ldconfig
