# krazkidd.github.io

## Requires:

- Docker CLI

## Prerequisites:

- GitHub Personal Access Token (classic)

  Follow [this guide](https://github.com/jekyll/github-metadata/blob/main/docs/authentication.md) to create a token. Use the token when running the Jekyll development server.

## Development:

### Starting the Jekyll server (Docker):

[This guide](https://gist.github.com/BillRaymond/db761d6b53dc4a237b095819d33c7332) was followed to containerize a local development server.

To generate the site files and launch the Jekyll development server in a Docker container, run the following after replacing `ghp_xxx` with your GitHub token

```ShellSession
$ cd /path/to/krazkidd.github.io
$ sudo docker build -t gh-pages:latest .
$ sudo docker run --rm --env JEKYLL_GITHUB_TOKEN=ghp_xxx -d -p 4000:4000/tcp --name gh-pages gh-pages:latest
```
