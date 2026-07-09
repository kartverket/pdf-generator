ARG version=8
FROM gotenberg/gotenberg:${version}

USER root

# Inter fonts
COPY fonts/ /usr/local/share/fonts/
RUN fc-cache -f /usr/local/share/fonts

USER gotenberg

CMD ["gotenberg", "--api-port=8089"]
