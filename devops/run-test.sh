#!/bin/bash

__DATA=`pwd`/data

# mount this to run local tests
# -v $__DATA/tests:/var/app/karate/src/test/java/features

docker run --rm -ti --name karate-dsl-test --env-file=dev.env -v $__DATA/.m2:/root/.m2 -v $__DATA/target:/var/app/karate/target -v $__DATA/tests:/var/app/karate/src/test/java/features docker.teqniksoft.com:5000/karate
