FROM nginx:stable-alpine

# Should be set to "at $COMMIT_SHA"
ARG VERSION_NOTE=""

COPY index.html index.txt SourceSans3.ttf /usr/share/nginx/html/
RUN sed -i "s/docker_version_note/${VERSION_NOTE:0:11}/" /usr/share/nginx/html/index.*

RUN rm /etc/nginx/conf.d/*
COPY index.conf /etc/nginx/conf.d/
