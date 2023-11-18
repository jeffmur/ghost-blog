FROM jekyll/builder:4.2.0

WORKDIR /srv/jekyll

RUN chmod -R 777 /srv/jekyll

# Cache Files
COPY Gemfile Gemfile
COPY build.sh build.sh
# COPY _config.yml _config.yml
# COPY _plugins/ _plugins/

RUN bundle install

ENTRYPOINT [ "./build.sh" ]