#!/bin/sh

SERVICE=$1

pcs resource unmanage $SERVICE
systemctl restart  $SERVICE

sleep  10

pcs resource manage $SERVICE
pcs resource cleanup  $SERVICE

