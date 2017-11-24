FROM base/archlinux

RUN pacman -Syy \
&& pacman -S shadowsocks-libev simple-obfs --noconfirm \
&& pacman -Scc --noconfirm

COPY config.json /etc/shadowsocks-libev/

WORKDIR /root

CMD ss-server -c /etc/shadowsocks-libev/config.json --plugin obfs-server --plugin-opts "obfs=tls"
