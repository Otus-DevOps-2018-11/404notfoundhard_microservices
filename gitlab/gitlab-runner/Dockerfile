FROM gitlab/gitlab-runner
COPY rootCA.crt /usr/local/share/ca-certificates
RUN update-ca-certificates -f
