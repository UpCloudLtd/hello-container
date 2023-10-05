FROM alpine:latest as build

# Should be set to "at $COMMIT_SHA"
ARG VERSION_NOTE=""

ARG EMOJI="👋"
ARG HELLO="Hello"

WORKDIR /work
COPY .ci/build-index-files.sh index.* SourceSans3.ttf ./
RUN ./build-index-files.sh

FROM nginx:stable-alpine

RUN rm /etc/nginx/conf.d/*
COPY index.conf /etc/nginx/conf.d/

COPY --from=build /work/out/* /usr/share/nginx/html/
