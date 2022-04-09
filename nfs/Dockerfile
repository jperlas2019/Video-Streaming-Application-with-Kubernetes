FROM centos
RUN yum -y install /usr/bin/ps nfs-utils && yum clean all
RUN mkdir -p /exports
ADD run_nfs.sh /usr/local/bin/
ADD index.html /tmp/index.html
RUN chmod 644 /tmp/index.html

# expose mountd 20048/tcp and nfsd 2049/tcp and rpcbind 111/tcp
EXPOSE 2049/tcp 20048/tcp 111/tcp 111/udp

ENTRYPOINT ["/usr/local/bin/run_nfs.sh", "/"]