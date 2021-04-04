#!/bin/bash
IFS=

# 1a
# regex="(INFO |ERROR )(.*)((?=[\(])(.*))"
regex1="(?<=ERROR )(.*)(?=\ )"
regex2="(?<=[(])(.*)(?=[)])"
regex3="(?=[(])(.*)(?<=[)])"
input="syslog.log";
# str="Jan 31 00:16:25 ubuntu.local ticky: INFO Closed ticket [#1754] (noel)"
