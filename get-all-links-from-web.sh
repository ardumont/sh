#!/usr/bin/python

import re, urllib
htmlSource = urllib.urlopen("http://sebsauvage.net/index.html").read(200000)
linksList = re.findall('<a href=(.*?)>.*?</a>',htmlSource)
for link in linksList:
    print link
