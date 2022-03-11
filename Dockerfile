FROM i386/alpine:3.13

ENV WINEARCH win32
ENV DISPLAY :0

# app files
WORKDIR /app/
COPY supervisord.conf /app/
COPY run.sh /app/

# configure wm
COPY openbox/menu.xml /root/.config/openbox/

RUN \
# install packages
	apk add --no-cache \
		bash \
		curl \
		git \
		openbox \
		supervisor \
		wine \
		x11vnc \
		xvfb \
	&& \
# install novnc
#	echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories \
#	&& \
#	apk add --no-cache \
#		novnc \
	git clone --depth 1 https://github.com/novnc/noVNC.git /app/noVNC && \
	git clone --depth 1 https://github.com/novnc/websockify.git /app/noVNC/utils/websockify && \
	rm -rf /app/noVNC/.git && \
	rm -rf /app/noVNC/utils/websockify/.git && \
	apk del git && \
	sed -i -- "s/ps -p/ps -o pid | grep/g" /app/noVNC/utils/novnc_proxy \
	&& \
# get app
	curl --remote-name https://download.info.apple.com/Mac_OS_X/041-0257.20120611.MkI85/AirPortSetup.exe

EXPOSE 8080

CMD [ "supervisord", "-c", "/app/supervisord.conf" ]
