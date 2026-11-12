FROM gotenberg/gotenberg:9.2.0-chromium@sha256:1b37aa0a4407b204ee810c64a4daf8c36c9a7c12115f2680c363530c3dd27d6c

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
