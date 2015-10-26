#!/bin/bash

echo "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>" > $2
echo "<gpx xmlns=\"http://www.topografix.com/GPX/1/1\" version=\"1.1\" creator=\"ICE Tracker\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd\">" >> $2

while read line
do
	LAT=$(echo $line | sed -E 's/.+latitude\":([0-9.]+),?\"?.+?\}/\1/')
	LON=$(echo $line | sed -E 's/.+longitude\":([0-9.]+),?\"?.+?\}/\1/')
	SPEED=$(echo $line | sed -E 's/.+speed\":([0-9]+\.?[0-9]?[0-9]?),?\"?.+?\}/\1/')
	TIMESTAMP=$(echo $line | sed -E 's/.+serverTime\":([0-9.]+)[0-9]{3},?\"?.+?\}/\1/')
	DATETIME=$(date -d @$TIMESTAMP +"%Y-%m-%dT%H:%M:%SZ")
	echo "<wpt lat=\"$LAT\" lon=\"$LON\"><time>$DATETIME</time><name><![CDATA[$SPEED]]></name></wpt>" >> /tmp/wpt-$2
	echo "<trkpt lat=\"$LAT\" lon=\"$LON\"><time>$DATETIME</time><extensions><speed>$SPEED</speed></extensions></trkpt>" >> /tmp/trk-$2
done < $1

cat /tmp/wpt-$2 >> $2
echo "<trk><name><![CDATA[ICE $TRAINID]]></name><cmt><![CDATA[ICE $TRAINID im ICE-Portal mitgeloggt]]></cmt><trkseg>" >> $2
cat /tmp/trk-$2 >> $2
echo "</trkseg></trk></gpx>" >> $2

rm /tmp/wpt-$2
rm /tmp/trk-$2
