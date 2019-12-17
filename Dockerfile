FROM ubuntu:18.04

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="Kalemena DocToolChain" \
      org.label-schema.description="Kalemena DocToolChain" \
      org.label-schema.url="private" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/kalemena/docker-doctoolchain" \
      org.label-schema.vendor="Kalemena" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

RUN    apt-get -y update \
    && apt-get -y install \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common \
        git \
        graphviz \
        openjdk-8-jdk \
        gradle \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# From Installation Guide (https://doctoolchain.github.io/docToolchain/#_get_the_tool)
RUN    cd /opt \
    && git clone --recursive https://github.com/docToolchain/docToolchain.git \
    && cd docToolchain \
    && rm -rf .git \
    && rm -rf resources/asciidoctor-reveal.js/.git \
    && rm -rf resources/reveal.js/.git

VOLUME /project
WORKDIR /project

ENV PATH="/opt/docToolchain/bin:${PATH}"
ENV GRADLE_USER_HOME=/project/.gradle

ADD [ "docInit*.sh", "/opt/" ]

CMD [ "/opt/docToolchain/bin/doctoolchain", ".", "generatePDF" ]