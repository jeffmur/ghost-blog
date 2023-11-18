FROM jekyll/builder:4.2.0

WORKDIR /srv/jekyll

RUN chmod -R 777 /srv/jekyll

# Cache Files
COPY Gemfile Gemfile

# COPY build.sh build.sh
# RUN chmod +x build.sh

RUN bundle install

# ENTRYPOINT ["./build.sh"]