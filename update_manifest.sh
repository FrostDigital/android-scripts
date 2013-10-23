#!/bin/bash
# @author: Sergey Nezdoliy
# Check that exactly 3 values were passed in
if [ $# -ne 3 ]; then
	echo -e "This script updates manifest file with versionCode and versionName values provided as parameters.\n"
	echo -e "Usage: $0 <xml filename> <versionCode value> <versionName value>"
	exit 127
fi
filename="$1"
version_code="$2"
version_name="$3"

echo "###Updating $1 file with versionCode=$2 and versionName=$3"
echo "###Changing debuggable flag"
# old_value=`cat $filename | grep android:debuggable`
echo "Old version is: " `cat "$filename" | grep android:debuggable`
sed -i  -e "s/android:debuggable=\"true\"/android:debuggable=\"false\"/g" "$filename"
echo "New version is: " `cat "$filename" | grep android:debuggable`

echo "###Changing versionCode"
echo "Old version is: " `cat "$filename" | grep android:versionCode`
sed -i -e "s/\(android:versionCode=\)\(\".*\"\)/\1\"${version_code}\"/g" "$filename"
echo "New version is: " `cat "$filename" | grep android:versionCode`

echo "###Changing versionName"
echo "Old version is: " `cat "$filename" | grep android:versionName`
sed -i -e "s/\(android:versionName=\)\(\".*\"\)/\1\"${version_name}\"/g" "$filename"
echo "New version is: " `cat "$filename" | grep android:versionName`
