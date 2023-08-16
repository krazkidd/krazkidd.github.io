# krazkidd.github.io

## Requires:

- Docker CLI

## Development:

### VS Code Recommended Extensions:

- sissel.shopify-liquid
  - TODO finish this
  - The Liquid template language server is file extension Prettier should ignore _\*.html_, _\*.scss_, and _\*.css_

### Starting the Jekyll server (Docker):

[This guide](https://gist.github.com/BillRaymond/db761d6b53dc4a237b095819d33c7332) was followed to containerize a local development server.

To generate the site files and launch the Jekyll development server in a Docker container, run

```ShellSession
$ cd /path/to/krazkidd.github.io
$ sudo docker build -t gh-pages:latest .
$ sudo docker run --rm -it -p 4000:4000/tcp --name gh-pages gh-pages:latest
```

## License:

This project is _not_ licensed to you for derivative works. Which is to say: Be sure to scrub everything under the `_data/` directory if you clone, fork, or otherwise share or redistribute the contents of this repository. You have your own experiences!

The layout comes from [this Jekyll template](https://github.com/krazkidd/resume-template).
