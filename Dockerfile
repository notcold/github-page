ARG RUBY_VERSION=2.7.4
FROM ruby:$RUBY_VERSION-alpine

WORKDIR /home/mypage
#
# docker build -t "notcold/github" .
# docker run -v $(pwd)/io:/home/mypage  -p 4000:4000 notcold/sk-githubpage:0531 bundle exec jekyll serve --host 0.0.0.0
# 
#
# Install base, Ruby, Headers, Jekyll, Bundler, github-pages Export Path
RUN apk update
RUN apk upgrade
RUN apk add curl wget bash cmake
RUN apk add libatomic readline readline-dev \
libxml2 libxml2-dev libxslt libxslt-dev zlib-dev zlib \
libffi-dev build-base git nodejs
RUN export PATH="/root/.rbenv/bin:$PATH"
RUN rm -rf /var/cache/apk/*
# Install Jekyll and required gems
RUN gem install bundler -v 2.4.22
RUN gem install jekyll -v 3.9.5
RUN gem install nokogiri -v 1.15.6

COPY Gemfile Gemfile

RUN NOKOGIRI_USE_SYSTEM_LIBRARIES=true bundle install

CMD ["exec", "jekyll"]
ENTRYPOINT ["bundle"]


