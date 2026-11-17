FROM gotenberg/gotenberg:9.5.0-chromium@sha256:7b6c7be51c3d7c8d3e68caf2d3992479a0ab8af27d5a9856977d9e1086179c91

USER root

# Inter fonts
COPY fonts/ /usr/local/share/fonts/
RUN fc-cache -f /usr/local/share/fonts

COPY chromium-wrapper.sh /usr/local/bin/chromium-wrapper
RUN chmod +x /usr/local/bin/chromium-wrapper

ENV CHROMIUM_ORIGINAL_BIN_PATH=/usr/bin/chromium
ENV CHROMIUM_BIN_PATH=/usr/local/bin/chromium-wrapper

USER gotenberg

CMD ["gotenberg", "--api-port=8089", "--api-timeout=2m", "--chromium-auto-start=true"]
