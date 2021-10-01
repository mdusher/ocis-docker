FROM centos:7

ENV EOS_VERSION=4.8.23
ENV XRD_VERSION=4.12.4
ENV QDB_PACKAGE=0.4.2

COPY files/ /

RUN chmod u+x /entrypoints/*

# ----- Install XRootD ----- #
RUN rpm --rebuilddb && yum -y install \
    eos-xrootd-${XRD_VERSION}  \
    xrootd-${XRD_VERSION}  \
    xrootd-client-${XRD_VERSION} \
    xrootd-client-libs-${XRD_VERSION} \
    xrootd-libs-${XRD_VERSION} \
    xrootd-selinux-${XRD_VERSION} \
    xrootd-server-${XRD_VERSION} \
    xrootd-server-libs-${XRD_VERSION} \
    xrootd-private-devel-${XRD_VERSION} && \
    yum clean all && \
    rm -rf /var/cache/yum

# ----- Install EOS & dependencies ----- #
RUN rpm --rebuilddb && yum -y install \
    bc \
    initscripts \
    libmicrohttpd \
    protobuf3 \
    hostname \
    jemalloc \
    eos-server-${EOS_VERSION} \
    eos-client-${EOS_VERSION} \
    eos-test-${EOS_VERSION} \
    eos-folly-2019.11.11.00 \
    leveldb \
    nc \
    zeromq && \
    yum clean all && \
    rm -rf /var/cache/yum

# ----- Install FST packages ----- #
RUN rpm --rebuilddb && yum -y install \
    jq \
    cryptsetup \
    e2fsprogs \
    xfsprogs \
    smartmontools && \
    yum clean all && \
    rm -rf /var/cache/yum

# ----- Install QuarkDB packages ----- #
RUN rpm --rebuilddb && yum -y install \
    hostname \
    redis \
    eos-ns-inspect-${EOS_PACKAGE} \
    quarkdb-${QDB_PACKAGE} && \
    yum clean all && \
    rm -rf /var/cache/yum

# ----- Raise limits ----- #
RUN echo "*               soft    nofile          200000" >> /etc/security/limits.conf && \
    echo "*               hard    nofile          200000" >> /etc/security/limits.conf

