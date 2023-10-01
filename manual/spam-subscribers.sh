#!/usr/bin/env bash

if [[ -z "${SPAM_TEST_URL}" ]]
then
  SPAM_TEST_URL="http://127.0.0.1:8000"
fi

for i in $(shuf --input-range "${SPAM_START:=1}-${SPAM_END:=500000}" --head-count "${SPAM_COUNT:=5}"); do
  (curl -s -o /dev/null -w "%{http_code} %{time_total} %{url_effective}\n" -d "name=le%20guin%20${i}&email=ursula_le_guin_${i}%40gmail.com" "${SPAM_TEST_URL}/subscriptions") &
done

wait
