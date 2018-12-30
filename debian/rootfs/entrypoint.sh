#!/bin/bash
set -x
export WDMRC_OPTIONS=$1
exec /usr/bin/mono /opt/runner/wdmrc.exe $WDMRC_OPTIONS -p 8810 -h http://* < /dev/null
