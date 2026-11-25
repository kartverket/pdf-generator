FROM gotenberg/gotenberg:9.9.2-chromium@sha256:eeba4cefc62158e87be8374aa6f5f5eb266d62051524f304f5f97522dbb634dc

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
