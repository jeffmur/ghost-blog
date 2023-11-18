FROM jekyll/builder:4.2.0

WORKDIR /srv/jekyll

RUN chmod -R 777 /srv/jekyll

# Cache Files
COPY Gemfile Gemfile
COPY build.sh build.sh
RUN chmod +x build.sh
# COPY _config.yml _config.yml
# COPY _plugins/ _plugins/

RUN bundle lock
RUN chmod 777 Gemfile.lock

RUN bundle install

USER root

# ENTRYPOINT ["./build.sh"]