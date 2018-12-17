#!/bin/bash
set -x
exec /usr/bin/mono /opt/runner/wdmrc.exe $WDMRC_OPTIONS -p 8010 -h http://* < /dev/null
