#!/bin/bash

#
# Ensure that we are in the folder containing this script
#
cd "$(dirname "${BASH_SOURCE[0]}")"

#
# Check for a license file
#
if [ ! -f './license.json' ]; then
  echo "Please provide a license.json file in the root folder in order to run the container"
  exit 1
fi

docker run -it -e PASSWORD=Password1 -e JAVA_OPTS="-Dse.curity.verifiable-credentials.enable=true" -v ${PWD}/license.json:/opt/idsvr/etc/init/license/license.json -v ${PWD}/idsvr/full-vci-configuration.xml:/opt/idsvr/etc/init/configuration.xml -p 6749:6749 -p 8443:8443 curity.azurecr.io/curity/idsvr:8.3.0
