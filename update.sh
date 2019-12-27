#!/bin/sh

#delete old content
rm -rf local

#recreate folders
mkdir local
mkdir local/templates
mkdir local/archetypes

#download templates
wget -O templates.zip --content-disposition https://ckm.highmed.org/ckm/retrieveResources?resourceType=template&templateType=normal&state1=INITIAL&state2=DRAFT&state3=TEAMREVIEW&state4=REVIEWSUSPENDED&state5=PUBLISHED&state6=REASSESS_DRAFT&state7=REASSESS_TEAMREVIEW&state8=REASSESS_REVIEWSUSPENDED&getLatestPublishedVersion=true

#download archetypes
wget -O archetypes.zip --content-disposition https://ckm.highmed.org/ckm/retrieveResources?resourceType=archetype&format=ADL&state1=INITIAL&state2=DRAFT&state3=TEAMREVIEW&state4=REVIEWSUSPENDED&state5=PUBLISHED&state6=REASSESS_DRAFT&state7=REASSESS_TEAMREVIEW&state8=REASSESS_REVIEWSUSPENDED&getLatestPublishedVersion=true

sleep 10

#unzip content
unzip templates.zip -d local/templates/
unzip archetypes.zip -d local/archetypes

rm templates.zip
rm archetypes.zip

git add local/
git commit -m "Update `date`"
