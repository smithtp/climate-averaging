#!/bin/bash
# Run script to download and then average climate variable across spatial units
# Tom Smith 2021

echo "Run cds download script over a particular date range"

python3 src/cds-era5-args.py -y 2020 -m 01 -c temperature humidity uv precipitation

echo "Average across single days"

cdo daymean data/cds-temp.grib data/cds-temp-dailymean.grib
cdo daymean data/cds-humid.grib data/cds-humid-dailymean.grib
cdo daymean data/cds-uv.grib data/cds-uv-dailymean.grib
cdo daymean data/cds-precip.grib data/cds-precip-dailymean.grib

echo "Average daily climate data across spatial regions"

Rscript src/clean-cds-era5.R -y 2020 -m 01

echo "... Finished averaging across regions! Files written to output directory!"
