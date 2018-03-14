#!/bin/bash

# before running these tests, set the following env vars:
# export ART_IP=<ip-or-domain-of-artifactory-server>
# export ART_USER=<artifactory-username>
# export ART_PWD=<artifactory-password>
# sample curl commands for artifactory API
# curl -u $ART_USER:$ART_PWD -X PUT "http://host:8081/artifactory/path-to-file" -T ./local-path-to-file
# Artifactory docker image: https://www.jfrog.com/confluence/display/RTF/Running+with+Docker
# curl -u admin:password http://192.168.99.100:8081/artifactory/api/storage/ext-release-local

set -e

source $(dirname $0)/helpers.sh



run it_can_list_releases_from_artifactory
run it_can_list_releases_from_artifactory_with_version
run it_can_list_releases_from_protected_artifactory_with_version
