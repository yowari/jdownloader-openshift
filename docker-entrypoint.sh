#!/usr/bin/env bash

echo "{ \"email\" : \"${EMAIL}\", \"password\" : \"${PASSWORD}\" }" > /opt/JDownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json

exec "$@"