#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import argparse

def join(args):
  dict = {}
  with open(args.file2) as f:
    for line in f:
      fields = line.strip().split()
      dict[fields[args.b - 1]] = fields
  
  fin = open(args.file1) if args.file1 != '-' else sys.stdin
  for line in fin:
    fields = line.strip().split()
    key = fields[args.a - 1]
    if key in dict:
      for f in dict[key][:(args.b - 1)]:
        fields.append(f)
      for f in dict[key][args.b:]:
        fields.append(f)
      print(' '.join(fields))

  if fin != sys.stdin:
    fin.close()

def main():
  parser = argparse.ArgumentParser()
  parser.add_argument('-a', type=int, default=1,
                      help='join on this FIELD of file 1')
  parser.add_argument('-b', type=int, default=1,
                      help='join on this FIELD of file 2')
  parser.add_argument('file1', help='FILE1')
  parser.add_argument('file2', help='FILE2')
  args = parser.parse_args()

  join(args)

if __name__ == '__main__':
  main()
