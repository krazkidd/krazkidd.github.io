# "#################################################"
# Dockerfile to build a GitHub Pages Jekyll site
#   - Ubuntu 22.04
#   - Ruby 3.1.2
#   - Jekyll 3.9.3
#   - GitHub Pages 288
#
#   This code is from the following Gist:
#   https://gist.github.com/BillRaymond/db761d6b53dc4a237b095819d33c7332#file-post-run-txt
#
# Instructions:
#  1. Copy all the text in this file
#  2. Create a file named Dockerfile and paste the code
#  3. Create the Docker image/container
#  4. Locate the shell file in this Gist file and run it in the local repo's root
# "#################################################"
FROM ubuntu:22.04

# "#################################################"
# "Install Ubuntu prerequisites for Ruby and GitHub Pages (Jekyll)"
# "Partially based on https://gist.github.com/jhonnymoreira/777555ea809fd2f7c2ddf71540090526"
RUN apt-get update && apt-get -y --no-install-recommends --no-install-suggests install \
    git \
    curl \
    autoconf \
    bison \
    build-essential \
    ca-certificates \
    libssl-dev \
    libyaml-dev \
    libreadline6-dev \
    zlib1g-dev \
    libncurses5-dev \
    libffi-dev \
    libgdbm6 \
    libgdbm-dev \
    libdb-dev \
    apt-utils \
    && rm -rf /var/lib/apt/lists/*

# "#################################################"
# "GitHub Pages/Jekyll is based on Ruby. Set the version and path"
# "As of this writing, use Ruby 3.1.2
# "Based on: https://talk.jekyllrb.com/t/liquid-4-0-3-tainted/7946/12"
ENV RBENV_ROOT /usr/local/src/rbenv
ENV RUBY_VERSION 3.1.2
ENV PATH ${RBENV_ROOT}/bin:${RBENV_ROOT}/shims:$PATH

# "#################################################"
# "Install rbenv to manage Ruby versions"
RUN git clone --depth 1 https://github.com/rbenv/rbenv.git ${RBENV_ROOT} \
    && git clone --depth 1 https://github.com/rbenv/ruby-build.git \
    ${RBENV_ROOT}/plugins/ruby-build \
    && ${RBENV_ROOT}/plugins/ruby-build/install.sh \
    && echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

# "#################################################"
# "Install ruby and set the global version"
RUN rbenv install ${RUBY_VERSION} \
    && rbenv global ${RUBY_VERSION}

# "#################################################"
# "Install the version of Jekyll that GitHub Pages supports"
# "Based on: https://pages.github.com/versions/"
# "Note: If you always want the latest 3.9.x version,"
# "       use this line instead:"
# "       RUN gem install jekyll -v '~>3.9'"
RUN gem install jekyll -v '3.9.3'

# Install ruby requirements
COPY Gemfile Gemfile.lock ./
RUN bundle install \
    && rm -rf /usr/local/bundle/cache

WORKDIR /src/site/
COPY . /src/site/

# Creates a non-root user with an explicit UID and adds permission to access the /src/site folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /src/site
USER appuser

EXPOSE 4000/tcp

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000", "--drafts", "--strict_front_matter", "--no-watch"]