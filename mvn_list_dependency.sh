#!/bin/sh


mvn dependency:resolve

mvn -o dependency:list \
| grep ":.*:.*:.*" \
| cut -d] -f2- \
| sed 's/:[a-z]*$//g' \
| sort -u
