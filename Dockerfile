FROM imega/base-builder:1.2.0

MAINTAINER Dmitry Gavriloff <info@imega.ru>

ADD build/rootfs.tar.gz /

EXPOSE 3306

VOLUME ["/data", "/etc/mysql/conf.d/"]

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENTRYPOINT ["mysqld"]

CMD ["--skip-grant-tables"]
