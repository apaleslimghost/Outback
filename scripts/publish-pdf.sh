#!/bin/sh

bin/linux/amd64/github-release upload \
	--user $CIRCLE_PROJECT_USERNAME \
  --repo $CIRCLE_PROJECT_REPONAME \
  --tag $CIRCLE_TAG \
  --name outback-basic-and-extended.pdf \
  --file outback-basic-and-extended.pdf
