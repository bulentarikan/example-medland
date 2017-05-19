#!/usr/bin/env bash

export GISRC=/home/ubuntu/.grass7/rc
export GISBASE=/usr/lib/grass72
export PATH=$PATH:$GISBASE/bin:$GISBASE/scripts:${GISBASE}/extrabin:${HOME}/.grass7/addons/scripts
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$GISBASE/lib
export PYTHONPATH=$PYTHONPATH:${GISBASE}/etc/python

# use process ID (PID) as lock file number:
export GIS_LOCK=$$

python r.agropast.semiadaptive.py $@
