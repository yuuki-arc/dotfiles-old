#!/bin/bash
/usr/local/bin/rrdtool graph bandwidth_graph.png \
-w 245 -h 80 -a PNG \
--start -1800 --end now \
--font DEFAULT:7:Menlo \
--title " " \
--lower-limit 0 \
--upper-limit MAX \
--right-axis 1:0 \
--x-grid none \
--y-grid none \
--border 0 \
--color ARROW#ffffff00 \
--color AXIS#ffffff \
--color BACK#ffffff00 \
--color CANVAS#ffffff00 \
--color FONT#ffffff \
DEF:inbyts=bandwidthusage_db.rrd:inbyts:MAX \
DEF:oubyts=bandwidthusage_db.rrd:oubyts:MAX \
CDEF:IBNone=inbyts,0,0,LIMIT,UN,UNKN,INF,IF \
AREA:inbyts#FFFFFF:"inBytes" \
GPRINT:inbyts:LAST:"Cur\: %5.2lf" \
GPRINT:inbyts:AVERAGE:"Avg\: %5.2lf" \
GPRINT:inbyts:MAX:"\t        Max\: %5.2lf" \
GPRINT:inbyts:MIN:"Min\: %5.2lf"
sleep 9
