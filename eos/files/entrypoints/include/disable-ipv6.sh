#!/bin/sh

sed '/ip6/d' /etc/hosts > /etc/tmphosts
sed -i '/localhost6/d' /etc/tmphosts
cat /etc/tmphosts > /etc/hosts
rm -f /etc/tmphosts