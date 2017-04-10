#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import distutils.core
import zipfile
import chardet

print "Processing File " + sys.argv[1]

userEncoding = False
if len(sys.argv) > 2:
    userEncoding = True
    encoding = sys.argv[2]

reload(sys)
sys.setdefaultencoding('utf-8')

file = zipfile.ZipFile(sys.argv[1],"r");
for name in file.namelist():
    if not userEncoding:
        encoding = chardet.detect(name)['encoding']
    print name + ' ' + encoding + ' ' + sys.getdefaultencoding() 
    utf8name = name.decode(encoding)
    print "  Extracting " + utf8name
    distutils.dir_util.mkpath(utf8name)
    data = file.read(name)
    if not os.path.exists(utf8name):
        fo = open(utf8name, "w")
        fo.write(data)
        fo.close
file.close()
