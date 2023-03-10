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
    make \
    libtool \
    pkg-config \
    flex \
    libbz2-dev \
    libclang-dev \
    bison \
    byacc



# https://github.com/phaag/nfdump/issues/202
# RUN apt install \
#     flex \
#     rrdtool \
#     librrd-dev \
#     libpcap-dev \
#     libtool \
#     m4 \
#     automake \
#     autogen \
#     build-essential \
#     libjson-c-dev \
#     pkg-config \
#     libbz2-dev \
#     bison \
#     doxygen \
#     graphviz


RUN gcc --version



# Install nfdump
RUN git clone https://github.com/phaag/nfdump.git
WORKDIR ${WORKDIR}

RUN ./autogen.sh
RUN ./configure --disable-dependency-tracking
RUN /usr/bin/make --version
RUN make install
RUN ldconfig