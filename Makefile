

VERSION := "master"
REPO_DOCS := "/home/clement/workspace/repos/kalemena/docker-asciidoc/doc-samples"

all: build

build:
	docker pull ubuntu:18.04
	docker build -t kalemena/doctoolchain:${VERSION} .

doc.init:
	docker run --rm -it -v ${REPO_DOCS}:/project kalemena/doctoolchain:${VERSION} /bin/bash /opt/docInit.sh

doc.initArc42:
	docker run --rm -it -v ${REPO_DOCS}:/project kalemena/doctoolchain:${VERSION} /bin/bash /opt/docInitArc42.sh
