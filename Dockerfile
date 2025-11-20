FROM alpine:3.19.1

LABEL maintainer="xiechengqi01@gmail.com" \
      version="1.0" \
      description="Alpine with Chromium and NoVNC"

USER root

# vnc resolution
# novnc
# gotty
# chromium
ENV \
	DISPLAY=:0 \
	VNC_RESOLUTION="1920x1080" \
	VNC_PORT="5900" \
	NOVNC_PASSWORD="123123" \
	NOVNC_VIEW_ONLY="false" \
	NOVNC_TITLE="Chromium" \
	NOVNC_WEB_INDEX="/app/index" \
	NOVNC_PORT="7900" \
        TERMINAL_PASSWORD="123123" \
	CHROMIUM_CLEAN_SINGLETONLOCK="false" \
	CHROMIUM_USER_DATA_DIR="/app/chromium/user-data" \
	CHROMIUM_REMOTE_DEBUGGING_PORT="9222" \
	CHROMIUM_START_URLS="chrome://version,http://localhost:2222,http://localhost:5000" \
	CHROMIUM_LANG="en-US" \
	CHROMIUM_LOAD_EXTENSION="" \
	CHROMIUM_PROXY_SERVER=""

COPY app /app

RUN     sed -i 's#https\?://dl-cdn.alpinelinux.org/alpine#https://mirrors.tuna.tsinghua.edu.cn/alpine#g' /etc/apk/repositories && \
        apk update && \
        apk add --no-cache ca-certificates curl wget vim bash htop net-tools vnstat sed \
        supervisor \
        xvfb \
        openbox \
        x11vnc \
        websockify \
        chromium chromium-chromedriver \
        pcre \
        nss alsa-lib font-noto font-noto-cjk \
        python3 py3-pip && \
        pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/ && \
        pip install -U pip --break-system-packages && \
        pip install --no-cache-dir --no-warn-script-location --break-system-packages selenium==4.26.0 && \
        pip install --no-cache-dir --no-warn-script-location --break-system-packages loguru && \
        mkdir -p /app/logs && \
        rm -rf /var/cache/apk/* /tmp/* # Wipe Temp Files

EXPOSE ${NOVNC_PORT}
# chromium debug port
EXPOSE 9223
# dufs
EXPOSE 5000
# gotty
EXPOSE 2222

WORKDIR /app

# CMD ["sleep", "infinity"]
CMD ["supervisord", "-l", "/app/logs/supervisord.log", "-c", "/app/supervisor/supervisord.conf"]
