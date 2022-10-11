# hello-container

Simple container for testing and demonstrating container and pod networking.

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

# Or with version note
docker build . -t hello-container --build-arg "VERSION_NOTE=at $(git rev-parse HEAD)"
```

Run `hello-container` with:

```sh
docker run -i -p 8080:80 --rm hello-container
```
