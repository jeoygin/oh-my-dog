#!/usr/bin/env bash
set -eo pipefail; [[ $TRACE ]] && set -x

# Add something like the following to your crontab
# 5,20,35,50 * * * * source /path/to/env && /path/to/icalsync.sh &> /dev/null

WGET="/usr/local/bin/wget"
AWK="/usr/local/bin/awk"
ICSFILE="${ICAL_DIR:?ICAL_DIR}/my.ics"
ORGFILE="${ICAL_DIR:?ICAL_DIR}/my.org"

$WGET -O "${ICSFILE}" "${ICAL_URL:?ICAL_URL}"
$AWK -f "${ICAL2ORG:?ICAL2ORG}" < "${ICSFILE}" > "${ORGFILE}"
