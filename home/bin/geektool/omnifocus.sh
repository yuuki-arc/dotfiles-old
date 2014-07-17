#!/bin/sh
OFOC=$(osascript -e 'tell application "Finder" to get id of application file id "OFOC"')
OFOC="com.omnigroup.OmniFocus.MacAppStore" # For Appstore-purchased variant use (slower) line above instead
echo "TASKS:"
sqlite3 $HOME/Library/Caches/$OFOC/OmniFocusDatabase2 '
SELECT p.name, c.name, tt.name
FROM ((task t left join projectinfo pi on t.containingprojectinfo=pi.pk) tt
left join task p on tt.task=p.persistentIdentifier)
left join context c on tt.context = c.persistentIdentifier
WHERE tt.dateCompleted is null
ORDER BY p.name, c.name' | awk '
BEGIN {FS="\|"; prj=0; ctx=0;}
{
# Whenever the value of col. 1 changes,
# write it out as a PROJECT header,
if (prj!=$1) {prj=$1; if (length(prj) < 1) {print "\n(INBOX)"}
else {print "\n" toupper(prj)}};

 # and whenever the value of col. 2 changes,
 # write it out as a [CONTEXT] sub-header.
 if (ctx!=$2) {ctx=$2; if (length(ctx) > 0) {print "[" ctx "]"}};

 # Whenever col 3. contains sth other than the project name,
 # write it out as a • TASK.
 if (length($3) > 0 && $3!=$1) {print "• " $3}
}'
