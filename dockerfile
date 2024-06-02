FROM scratch

ADD alpine-minirootfs-3.20.0-x86_64.tar.gz /

CMD [ "/bin/sh" ]