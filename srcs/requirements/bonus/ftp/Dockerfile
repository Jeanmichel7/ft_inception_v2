# syntax=docker/dockerfile:1
FROM debian:buster

ARG FTP_USER \
    FTP_PWD

RUN apt-get update && apt-get install -y vsftpd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && mkdir -p /var/run/vsftpd/empty

RUN useradd -d /var/www -s /bin/bash jrasser \
    && echo "jrasser:jrasser" | chpasswd \
    && usermod -a -G root jrasser

RUN sed -i 's|#chroot_local_user=YES|chroot_local_user=YES|g' /etc/vsftpd.conf \
    && sed -i 's|#local_enable=YES|local_enable=YES|g' /etc/vsftpd.conf \
    && sed -i 's|#write_enable=YES|write_enable=YES|g' /etc/vsftpd.conf \
    && sed -i 's|#local_umask=022|local_umask=007|g' /etc/vsftpd.conf

RUN echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf \
    && echo "seccomp_sandbox=NO" >> /etc/vsftpd.conf \
    && echo "pasv_enable=YES" >> /etc/vsftpd.conf

WORKDIR /var/www

EXPOSE 21

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]