#!/usr/bin/python

from subprocess import call

i = 0
while i < 10:
    call(["java","-jar","busqueda-local.jar"])
    i = i + 1
