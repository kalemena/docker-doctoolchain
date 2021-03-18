

VERSION := "master"
REPO_DOCS := "/home/clement/workspace/repos/kalemena/docker-doctoolchain/src/docs/arc42"

all: build

build:
	docker pull ubuntu:20.04
	docker build -t kalemena/doctoolchain:${VERSION} .

doc.init:
	docker run --rm -it -v ${REPO_DOCS}:/project kalemena/doctoolchain:${VERSION} /bin/bash /opt/docInit.sh

doc.initArc42:
	docker run --rm -it -v ${REPO_DOCS}:/project kalemena/doctoolchain:${VERSION} /bin/bash /opt/docInitArc42.sh

doc.build.pdf:
	docker run --rm -it -v ${REPO_DOCS}:/project kalemena/doctoolchain:${VERSION}

doc.build.html:
	docker run --rm -it -v ${REPO_DOCS}:/project kalemena/doctoolchain:${VERSION} doctoolchain . generateHTML

doc.build.confluence:
	docker run --rm -it -v ${REPO_DOCS}:/project kalemena/doctoolchain:${VERSION} doctoolchain . publishToConfluence