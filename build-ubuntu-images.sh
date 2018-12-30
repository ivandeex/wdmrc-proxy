#!/bin/bash
WDMRC_VERS="1.10.2.2"

for DIR in xenial-core xenial-mono bionic-core bionic-mono ; do
  perl -i -p -e "s/WDMRC_VERS=\"[0-9.]+\"/WDMRC_VERS=\"$WDMRC_VERS\"/g" $DIR/Dockerfile
done

#exit

for DIR in xenial-core xenial-mono bionic-core bionic-mono ; do
  TAG="ivandeex/wdmrc:v$WDMRC_VERS-${DIR/-/.}"
  echo ">>>>>>>>>>>>>>>> BUILDING: $TAG ..."
  echo
  echo docker build -t $TAG $DIR
  docker build -t $TAG $DIR
  echo
  echo "============================================"
  echo
done

