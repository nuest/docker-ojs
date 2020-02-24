#!/usr/bin/env bash

# ===============================================================================
#          FILE:  build-dev.sh
#
#   DESCRIPTION:  A script to generate the folder structure and required
#                 files to run a containerised development version of OJS.
#
#        AUTHOR:  Daniel Nüst
#  ORGANIZATION:  Public Knowledge Project (PKP)
#       LICENSE:  GPL 3
#===============================================================================

set -Eeuo pipefail

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

printf "\n\nBUILDING OJS DEV DOCKER STACK\n"

mkdir -p "versions/dev"
cp "templates/common/env" "versions/dev/.env"
cp "templates/exclude.list" "versions/dev/exclude.list"
#cp "templates/helpers/config-dev.inc.php" "versions/dev/config-dev.inc.php"
cp "templates/dockerFiles/Dockerfile.dev" "versions/dev/Dockerfile.dev"

ojs='master'
sed -e "s!%%OJS_VERSION%%!$ojs!g" \
    "templates/dockerComposes/docker-compose-dev.template" \
    > "versions/dev/docker-compose.yml"

printf "\nBUILT files into versions/dev\n"
