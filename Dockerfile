FROM gotenberg/gotenberg:8

USER root

# Inter fonts
COPY fonts/ /usr/local/share/fonts/
RUN fc-cache -f /usr/local/share/fonts

USER gotenberg

CMD ["gotenberg", "--api-port=8089"]
