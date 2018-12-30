#!/bin/bash
export DOTNET_CLI_TELEMETRY_OPTOUT=1
cd /opt/runner
exec < /dev/null
set -x
exec /usr/bin/dotnet /opt/runner/wdmrc.dll $WDMRC_OPTIONS -p 8810 -h http://*
