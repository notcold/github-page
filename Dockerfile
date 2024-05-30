FROM alpine:latest

LABEL maintainer="notcold <shikuan1992@gmail.com>"

EXPOSE 4000

WORKDIR /site

RUN apk update && \
    apk --update add \
    gcc \
    g++ \
    make \
    git \
    curl \
    bison \
    ca-certificates \
    tzdata \
    ruby \
    ruby-rdoc \
    ruby-irb \
    ruby-nokogiri \
    ruby-dev \
    glib-dev \
    zlib-dev \
    libc-dev && \
    echo 'gem: --no-document' > /etc/gemrc && \
    gem install github-pages --version 228 && \
    gem install jekyll-watch && \
    gem install jekyll-admin && \
    gem install bundler -v 1.17.3 \
    apk del gcc g++ binutils bison perl nodejs make curl && \
    rm -rf /var/cache/apk/*  \
CMD ["exec", "jekyll"]
ENTRYPOINT ["bundle"]