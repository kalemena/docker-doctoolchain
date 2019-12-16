

VERSION := "master"

all: build

build:
	docker pull ubuntu:18.04
	docker build -t kalemena/doctoolchain:${VERSION} .
