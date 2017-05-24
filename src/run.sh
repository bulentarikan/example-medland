#!/usr/bin/env bash

YEARS=${1:-2}

# Set environment variables for GRASS
export GISRC=/home/ubuntu/.grass7/rc
export GISBASE=/usr/lib/grass72
export PATH=$PATH:$GISBASE/bin:$GISBASE/scripts:${GISBASE}/extrabin:${HOME}/.grass7/addons/scripts
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$GISBASE/lib
export PYTHONPATH=$PYTHONPATH:${GISBASE}/etc/python

# use process ID (PID) as lock file number:
export GIS_LOCK=$$

if [ ! -f /home/ubuntu/downloads/Penaguila.zip ]; then
   echo "Downloading Penguila.zip"
   cd /home/ubuntu/downloads \
     && curl -O https://dev.commons.asu.edu/data/comses/Penaguila.zip \
     && rm -rf grassdata/Penaguila \
     && unzip -q Penaguila.zip -d ../grassdata \
     && cd -
else
   echo "Penaguila.zip already exists. Continuing"
fi

# Run the simulation on the Penaguila location
python r.agropast.semiadaptive.py years=$YEARS prfx=sim costsurf=farm_catch_10yr_30ppl_cost_surface@PERMANENT agcatch=farm_catch_10yr_30ppl@PERMANENT grazecatch=graze_catch@PERMANENT fodder_rules=/home/ubuntu/grassdata/Penaguila/rules/fodder_rules.txt inlcov=init_veg@PERMANENT infert=init_fert@PERMANENT lc_rules=/home/ubuntu/grassdata/Penaguila/rules/luse_reclass_rules.txt cfact_rules=/home/ubuntu/grassdata/Penaguila/rules/cfactor_recode_rules.txt elev=filledDEM@PERMANENT initbdrk=init_bdrk@PERMANENT --overwrite
