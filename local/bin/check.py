#!/usr/bin/env python

input = raw_input("Input: ")
confirm = raw_input("Confirm: ")

if input == confirm:
  print('{} matched'.format(input))
else:
  print('Dismatched...')
