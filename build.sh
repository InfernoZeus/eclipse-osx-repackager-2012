#! /bin/bash

SCRIPT="EclipseOSXRepackager2012.sh"
APP_SCRIPT="EclipseOSXRepackager"
APP_SCRIPT_LOCATION="/Contents/Resources/"
APP_SKELETON="appSkeleton"
BUILD_LOCATION="build"
APP_BUNDLE="$BUILD_LOCATION/Eclipse OS X Repackager 2012.app"


if [ "$1" == "--clean" ]; then
	rm -R "$BUILD_LOCATION"
	exit
fi

if [ ! -d "$APP_SKELETON" ]; then
	echo "Application Bundle Skeleton folder not found: $APP_SKELETON"
	exit
fi

if [ ! -f "$SCRIPT" ]; then
   echo "Shell Script was not found: $SCRIPT"
   exit
fi

if [ -d "$APP_BUNDLE" ]; then
	rm -R "$APP_BUNDLE"
fi

mkdir "$BUILD_LOCATION"
mkdir "$APP_BUNDLE"

cp -R "$APP_SKELETON"/* "$APP_BUNDLE"/
cp "$SCRIPT" "$APP_BUNDLE/$APP_SCRIPT_LOCATION/$APP_SCRIPT"


