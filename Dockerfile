# This is a really simple docker-file to load a script for testing

FROM r-base
VOLUME /data
ADD data /data
ENTRYPOINT ["R", "--no-save"]
