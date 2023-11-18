FROM jekyll/builder:4.2.0

WORKDIR /srv/jekyll

# Cache Gemfile
COPY Gemfile Gemfile

RUN bundle install