#!/bin/bash

bundle exec jekyll build

tar -czvf site.tar.gz _site