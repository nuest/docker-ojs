#!/usr/bin/env bash

# ===============================================================================
#          FILE:  build.sh
#
#         USAGE:  build [<ojs>]
#
#   DESCRIPTION:  A script to generate the folder structure and required
#                 files to run a full OJS stack.
#
#    PARAMETERS:
#  <ojs>:  (optional) The release version that you like to generate.
#                 If any, all the existing versions will be created.
#  REQUIREMENTS:  ---
#     TODO/BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Dulip Withanage, David Cormier, Marc Bria.
#  ORGANIZATION:  Public Knowledge Project (PKP)
#       LICENSE:  GPL 3
#       CREATED:  04/02/2020 23:50:15 CEST
#       UPDATED:  05/02/2020 19:52:25 CEST
#      REVISION:  1.0
#===============================================================================

set -Eeuo pipefail

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

printf "\n\nBUILDING OJS DEV DOCKER STACK\n"
printf "=============================\n\n"

docker build --tag ojs:master versions/master/alpine/apache/php7/
