#!/usr/bin/env bash

get_arch() {
  uname | tr '[:upper:]' '[:lower:]'
}

get_cpu() {
  local machine_hardware_name
  machine_hardware_name=${ASDF_TEMPORALITE_OVERWRITE_ARCH:-"$(uname -m)"}

  case "$machine_hardware_name" in
    'x86_64') local cpu_type="amd64";;
    'powerpc64le' | 'ppc64le') local cpu_type="ppc64le";;    
    'aarch64') local cpu_type="arm64";;
    'armv7l') local cpu_type="arm";;
    *) local cpu_type="$machine_hardware_name";;
  esac

  echo "$cpu_type"
}

get_download_url() {
  local version="$1"
  local platform="$(get_arch)"

  echo "https://github.com/temporalio/temporalite/releases/download/v${version}/temporalite_${version}_${platform}_$(get_cpu).tar.gz"
}

list_all_versions() {
  git ls-remote --tags --refs https://github.com/temporalio/temporalite.git |
    grep -o 'refs/tags/.*' |
    cut -d/ -f3- |
    sed 's/^v//'
}

# stolen from https://github.com/rbenv/ruby-build/pull/631/files#diff-fdcfb8a18714b33b07529b7d02b54f1dR942
sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' | \
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}
