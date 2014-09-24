#! /bin/bash

# Just browse throught the directories and build all the Dockerfiles found.
for directory in `find . -name Dockerfile -exec dirname {} \;` ;do
	cd ${directory}
	docker build .
done 