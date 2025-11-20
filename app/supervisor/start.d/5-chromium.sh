#!/usr/bin/env bash

[ "${CHROMIUM_CLEAN_SINGLETONLOCK}" = "true" ] && rm -f ${CHROMIUM_USER_DATA_DIR}/SingletonLock
chromium \
--no-sandbox \
--disable-dev-shm-usage \
--disable-popup-blocking \
--disable-gpu \
--start-maximized \
--no-first-run \
--no-default-browser-check \
--ozone-platform=x11 \
--password-store=basic \
--enable-features=NetworkService,NetworkServiceInProcess,LoadCryptoTokenExtension,PermuteTLSExtensions \
--disable-features=FlashDeprecationWarning,EnablePasswordsAccountStorage \
--enable-blink-features=IdleDetection,Fledge,Parakeet \
--lang=${CHROMIUM_LANG} \
--user-data-dir=${CHROMIUM_USER_DATA_DIR} \
--load-extension=${CHROMIUM_LOAD_EXTENSION} \
--proxy-server=${CHROMIUM_PROXY_SERVER} \
--remote-debugging-port=${CHROMIUM_REMOTE_DEBUGGING_PORT} ${CHROMIUM_START_URL}

# --profile-directory=Default \
# --ozone-platform-hint=auto \
# --test-type=webdriver \
