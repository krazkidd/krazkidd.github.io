# krazkidd.github.io

## Development

### VS Code Recommended Extensions

- sissel.shopify-liquid
  - Provides auto-formatting of Liquid templates.

  The Liquid template language server is file extension dependent. Prettier should ignore _\*.html_, _\*.scss_, and _\*.css_ files.

### Starting the Jekyll server (Docker)

To generate the site files and launch the Jekyll development server in a Docker container, run:

```ShellSession
docker build -t krazkidd.github.io .
docker run --rm --network host krazkidd.github.io
```

## License

This project is _not_ licensed to you for derivative works. Which is to say: Be sure to scrub everything under the `_data/` directory if you clone, fork, or otherwise share or redistribute the contents of this repository. You have your own experiences!

What you really want is the Jekyll template, which comes from [this repo](https://github.com/krazkidd/resume-template) and is itself a fork of [another repo](https://github.com/jglovier/resume-template). You should fork one of these (so your resume is stable) and supply your own data however you like.
