#!/bin/bash

set -e +x

pushd movie-fun
  echo "Packaging JAR"
  mvn clean install -DskipTests=true
popd

jar_count=`find movie-fun/target -type f -name *.war | wc -l`

if [ $jar_count -gt 1 ]; then
  echo "More than one jar found, don't know which one to deploy. Exiting"
  exit 1
fi

find movie-fun/target -type f -name *.war -exec cp "{}" package-output/moviefun.war \;

echo $(pwd)
echo $(ls)

cd package-output

echo "After cd'ing..."
echo $(ls)

echo "Done packaging"
exit 0
