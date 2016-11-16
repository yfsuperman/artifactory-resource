#!/bin/bash

set -e

source $(dirname $0)/helpers.sh

it_can_list_releases_from_artifactory() {

  # local local_ip=$(find_docker_host_ip)
  #local_ip="localhost"
  artifactory_ip=$ART_IP
  TMPDIR=/tmp

  local src=$(mktemp -d $TMPDIR/in-src.XXXXXX)
  local endpoint="http://${artifactory_ip}:8081/artifactory"
  local regex="ecd-front-(?<version>.*).tar.gz"
  local folder="/generic/ecd-front"

  check_without_credentials_and_version $endpoint $regex $folder $src

}

it_can_list_releases_from_artifactory_with_version() {

  # local local_ip=$(find_docker_host_ip)
  #local_ip="localhost"
  artifactory_ip=$ART_IP
  TMPDIR=/tmp

  local src=$(mktemp -d $TMPDIR/in-src.XXXXXX)
  local endpoint="http://${artifactory_ip}:8081/artifactory"
  local regex="ecd-front-(?<version>.*).tar.gz"
  local folder="/generic/ecd-front"
  local version="20161109222826"

  check_without_credentials_with_version $endpoint $regex $folder $version $src

}

it_can_list_releases_from_protected_artifactory_with_version() {

  # local local_ip=$(find_docker_host_ip)
  #local_ip="localhost"
  artifactory_ip=$ART_IP
  TMPDIR=/tmp


  local src=$(mktemp -d $TMPDIR/in-src.XXXXXX)
  local endpoint="http://${artifactory_ip}:8081/artifactory"
  local regex="ecd-front-(?<version>.*).tar.gz"
  local folder="/generic/ecd-front"
  local version="20161109222826"
  local username="${ART_USER}"
  local password="${ART_PWD}"

  check_with_credentials_with_version $endpoint $regex $username $password $folder $version $src

}

run it_can_list_releases_from_artifactory
run it_can_list_releases_from_artifactory_with_version
run it_can_list_releases_from_protected_artifactory_with_version
