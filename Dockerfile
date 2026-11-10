FROM gotenberg/gotenberg:9.1.0-chromium@sha256:06ce00e2efdb9bf749bdf42c4d793a163a059ee14609b8994bcf38d7fdef5f41

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
