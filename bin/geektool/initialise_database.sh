#!/bin/bash
rrdtool create bandwidthusagedb.rrd \
--step 10 \
DS:inbyts:COUNTER:20:0:U \
DS:oubyts:COUNTER:20:0:U \
RRA:MAX:0.5:1:900

