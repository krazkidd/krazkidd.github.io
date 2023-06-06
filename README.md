# krazkidd.github.io

## Requires:

- Docker CLI

## Development:

### Starting the Jekyll server (Docker):

[This guide](https://gist.github.com/BillRaymond/db761d6b53dc4a237b095819d33c7332) was followed to containerize a local development server.

To generate the site files and launch the Jekyll development server in a Docker container, run

```ShellSession
$ cd /path/to/krazkidd.github.io
$ sudo docker build -t gh-pages:latest .
$ sudo docker run --rm -it -p 4000:4000/tcp --name gh-pages gh-pages:latest
```
