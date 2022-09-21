# Container image that runs your code
FROM ghcr.io/anybody/anybodycon-linux:7.4.2

# Docker actions must be run with root as the default user
USER root
RUN chown root /wine && \
    cp -R /wine/drive_c/users/mambauser /wine/drive_c/users/root && \
    chown -R root /wine/drive_c/users/root

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /tmp/entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/usr/local/bin/_entrypoint.sh", "/tmp/entrypoint.sh"]
