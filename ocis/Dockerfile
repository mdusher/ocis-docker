FROM centos:7

ENV EOS_VERSION=4.8.23
ENV XRD_VERSION=4.12.4

COPY files/ /
COPY --from=owncloud/ocis:1.12 /usr/bin/ocis /usr/bin/ocis

# ----- Install EOS & dependencies ----- #
RUN rpm --rebuilddb && yum -y install \
    eos-client-${EOS_VERSION} \
    xrootd-client-${XRD_VERSION} \
    mailcap \
    ca-certificates \
    nc \
    curl && \
    yum clean all && \
    rm -rf /var/cache/yum

ENTRYPOINT ["/usr/bin/ocis"]
CMD ["server"]