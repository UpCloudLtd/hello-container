# hello-container

Simple container for testing and demonstrating container and pod networking.

## Development

Build `hello-container` image with:

```sh
docker build . -t hello-container

# Or with version note
docker build . -t hello-container --build-arg "VERSION_NOTE=at $(git rev-parse HEAD)"
```

Run `hello-container` with:

```sh
docker run -i -p 8080:80 --rm hello-container
```
