#!/usr/bin/env bash
myname=`basename $0`

if [ $# -lt 1 ]; then
  grep '.*=.*' "$HOME/.otpkeys" | while read line
  do
    _name=$( echo "${line}" | cut -d'=' -f 1 )
    _otpkey=$( echo "${line}" | cut -d'=' -f 2 | sed 's: ::g' )
    _token=$( oathtool --totp -b "${_otpkey}" )
    echo "${_name}: ${_token}"
  done 
else
  _otpkey=$( grep "^$1=" "$HOME/.otpkeys" | cut -d'=' -f 2 | sed 's: ::g' )
  if [ -z "${_otpkey}" ]; then
    echo "$myname: no such service $1"
    exit -1
  fi
  _token=$( oathtool --totp -b "${_otpkey}" )
  echo "${_token}"
  echo -n "${_token}" | pbcopy
fi
