FROM debian:buster-slim

# Base system upgrades
RUN apt-get update && apt-get dist-upgrade --yes

# Debian software
RUN apt-get install --yes \
    # Static site generator
    hugo \
    # Tiny bit valid init for contianers
    tini \
    # Ruby interpreter
    ruby

# Install asciidoctor
RUN gem install \
        asciidoctor:1.5.8 \
        asciidoctor-bibtex \
        rouge

COPY usr/local/bin/asciidoctor /usr/local/bin/asciidoctor

RUN mkdir -p /site

WORKDIR /site

CMD ["hugo"]
