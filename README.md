# hello-container

Simple container for testing and demonstrating

- container and pod networking, and
- (rolling) deployment updates.

The container runs an nginx server that (from the `/` root route) returns either HTML or TXT response with `Hello! 👋` message as well as containers hostname and address.

## Usage

To create a deployment and expose it from your Kubernetes cluster, run:

```sh
kubectl create deployment --image=ghcr.io/upcloudltd/hello hello
kubectl expose deployment hello --port=80 --target-port=80 --type=LoadBalancer
kubectl get svc -w
```

This process might take a few minutes. After external IP for hello service is visible, use it to test that pod is reachabe from the internet. For example:

```sh
$ curl http://lb-${id}.upcloudlb.com
```

## Development

Build `hello-container` image with:

```sh
docker build . -t hello-container

# With version note
docker build . -t hello-container --build-arg "VERSION_NOTE=at $(git rev-parse HEAD)"

# With custom emoji and greeting
docker build . -t hello-container \
  --build-arg "VERSION_NOTE=at $(git rev-parse HEAD)" \
  --build-arg "EMOJI=🐄" \
  --build-arg "HELLO=Moo"
```

Run `hello-container` with:

```sh
docker run -i -p 8080:80 --rm hello-container
```
