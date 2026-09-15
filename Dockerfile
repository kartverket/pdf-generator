FROM gotenberg/gotenberg:8.37.0-chromium@sha256:0d28ae9a96441588ef739623726bd500ad0720b77266c6f1351a13e333fbd61c

USER root

# Inter fonts
COPY fonts/ /usr/local/share/fonts/
RUN fc-cache -f /usr/local/share/fonts

USER gotenberg

CMD ["gotenberg", "--api-port=8089", "--api-timeout=2m", "--chromium-auto-start=true"]
