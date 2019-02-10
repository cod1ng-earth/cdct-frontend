#!/bin/bash

nohup google-chrome \
	--headless \
	--no-sandbox \
    --disable-setuid-sandbox \
	--disable-gpu \
	--disable-background-networking \
	--disable-default-apps \
	--disable-extensions \
	--disable-sync \
	--disable-translate \
	--hide-scrollbars \
	--metrics-recording-only \
	--mute-audio \
	--no-first-run \
	--safebrowsing-disable-auto-update \
	--ignore-certificate-errors \
	--ignore-ssl-errors \
	--ignore-certificate-errors-spki-list \
	--user-data-dir=/tmp \
	--remote-debugging-port=${PORT} \
	--remote-debugging-address=0.0.0.0
