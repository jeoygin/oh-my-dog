#!/bin/bash

_shell_name=$(basename "$0")

if [[ $# -lt 1 ]] ; then
  echo "Usage: $_shell_name {FILE} [TABWIDTH]"
  exit 1
fi

_file="$1"
_filename=$(basename "$_file")
_tmp_dir="/tmp/tab2space"
_backup_file="${_tmp_dir}/${_filename}"
_tmp_file="${_backup_file}.tmp"

if [[ ! -f "$_file" ]] ; then
  echo "$_file does not exist!"
  exit 1
fi

_tab_wd=4
if [[ -n "$2" ]] ; then
  _tab_wd=$2
fi

[[ -e "$_tmp_dir" ]] || mkdir -p "$_tmp_dir"

echo "Backup '$_file' to '$_backup_file'"
\cp "$_file" "$_backup_file"
echo "Convert tab to $_tab_wd whitespaces..."
expand -t $_tab_wd "$_file" > "$_tmp_file"
echo "Save '$_file'"
\cp "$_tmp_file" "$_file"


