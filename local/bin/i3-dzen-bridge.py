#!/usr/bin/env python

"""
Bridge i3status output to dzen2. Make **ICON** in dzen2 display

Author: Wang Chao <https://github.com/yueyoum>
"""


import sys
import os
import re

PROJECT_PATH = os.path.dirname(os.path.realpath(__file__))

PREFIX = os.path.join(PROJECT_PATH, 'xbm-icons')
WIFI   = '^i(%s/net-wifi4.xbm)' % PREFIX
WIRED  = '^i(%s/net-wired.xbm)' % PREFIX
VOL    = '^i(%s/vol-hi.xbm)' % PREFIX
BAT    = '^i(%s/power-bat2.xbm)' % PREFIX
AC     = '^i(%s/power-ac.xbm)' % PREFIX
CPU    = '^i(%s/cpu.xbm)' % PREFIX
TEMP   = '^i(%s/temp.xbm)' % PREFIX
LOAD   = '^i(%s/load.xbm)' % PREFIX
MEM    = '^i(%s/mem.xbm)' % PREFIX



REPLACE_ITEM = {
    '_W': WIFI,
    '_E': WIRED,
    '_V': VOL,
    '_B': BAT,
    '_U': CPU,
    '_T': TEMP,
    '_L': LOAD,
    '_M': MEM,
}.items()


COLORS = {
    'GREEN' : '^fg(#00FF00)',
    'YELLOW': '^fg(#FFFF00)',
    'RED'   : '^fg(#FF0000)',
}

CPU_PATTERN = re.compile('_U:\s+(\d{2,3})%')
TEMP_PATTERN = re.compile('_T:\s+(\d+)\s?')
MEM_PATTERN = re.compile('_M:\s+{{mem_avail}}')
MEM_AVAIL_PATTERN = re.compile('MemAvailable:\s+(\d+)\s+kB')

def get_color(t):
    if t < 50:
        color = COLORS['GREEN']
    elif t < 80:
        color = COLORS['YELLOW']
    else:
        color = COLORS['RED']
    return color


while True:
    # Fix Python 2.x.
    try: input = raw_input
    except NameError: pass

    line = input()

    cpu_usage_matches = CPU_PATTERN.search(line)
    if cpu_usage_matches is not None:
        cpu_usage = cpu_usage_matches.groups()[0]
        origin_cpu_text = cpu_usage_matches.group()
        new_cpu_text = get_color(int(cpu_usage)) + origin_cpu_text
        line = line.replace(origin_cpu_text, new_cpu_text)

    temperature_matches = TEMP_PATTERN.search(line)
    if temperature_matches is not None:
        temperature = temperature_matches.groups()[0]
        origin_temp_text = temperature_matches.group()
        new_temp_text = get_color(int(temperature)) + origin_temp_text
        line = line.replace(origin_temp_text, new_temp_text)

    mem_matches = MEM_PATTERN.search(line)
    if mem_matches is not None:
        origin_mem_text = mem_matches.group()
        with open('/proc/meminfo', 'r') as f:
            meminfo = f.read()
            mem_avail_matches = MEM_AVAIL_PATTERN.search(meminfo)
            if mem_avail_matches is not None:
                mem_avail = float(mem_avail_matches.groups()[0])/1024/1024
                color = COLORS['GREEN']
                if mem_avail < 0.5:
                    color = COLORS['RED']
                elif mem_avail < 1:
                    color = COLORS['YELLOW']
                new_mem_text = color + origin_mem_text.replace('{{mem_avail}}', '{:.2f}G'.format(mem_avail))
                line = line.replace(origin_mem_text, new_mem_text)

    for k, v in REPLACE_ITEM:
        line = line.replace(k, v)

    sys.stdout.write(line + "\n")
    sys.stdout.flush()

