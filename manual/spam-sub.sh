#!/usr/bin/env bash

for i in $(shuf --input-range "${START:=1}-${END:=500000}" --head-count "${COUNT:=5}"); do
  curl -v -XPOST -d "name=le%20guin%20${i}&email=ursula_le_guin_${i}%40gmail.com" "http://127.0.0.1:8000/subscriptions" &
done
