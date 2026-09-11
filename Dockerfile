FROM gotenberg/gotenberg:8.36.0-chromiumsha256:a40f92d7419adbf98fd2ab2e4211f6186c9fd44f196a5aadbd2769bf237faae6

USER root

# Inter fonts
COPY fonts/ /usr/local/share/fonts/
RUN fc-cache -f /usr/local/share/fonts

USER gotenberg

CMD ["gotenberg", "--api-port=8089", "--api-timeout=2m"]
