FROM gotenberg/gotenberg:9.9.3-chromium@sha256:22bfa8b9abf2597aa4665df6d910040007146083eec240159256c8ba1d0cc341

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
