#!/bin/sh

# copy_postgresql_config_files.sh
# PostgreSQL

# Copyright (c) 2013 Apple Inc. All Rights Reserved.
#
# IMPORTANT NOTE: This file is licensed only for use on Apple-branded
# computers and is subject to the terms and conditions of the Apple Software
# License Agreement accompanying the package this file is a part of.
# You may not port this file to another platform without Apple's written consent.

#
# Copies the default PostgreSQL config file into /Library/Server during promotion or migration
#

ServerRoot="/Applications/Server.app/Contents/ServerRoot"
SourceConfig="$ServerRoot/Library/Preferences/org.postgresql.postgres.plist"
ConfigDir="/Library/Server/PostgreSQL/Config"
DestConfig="$ConfigDir/org.postgresql.postgres.plist"

echo "Creating directory $ConfigDir..."
/bin/mkdir -p "$ConfigDir"
if [ $? != 0 ]; then
	echo "Error creating directory, exiting"
	exit 1;
fi
/usr/sbin/chown _postgres:_postgres "$ConfigDir"
/bin/chmod 0755 "$ConfigDir"

echo "Copying PostgreSQL configuration files into /Libary/Server..."
/usr/bin/ditto "$SourceConfig" "$DestConfig"
/usr/sbin/chown _postgres:_postgres "$DestConfig"
/bin/chmod 644 "$DestConfig"
echo "Finished."
