#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
img2ascii.py
"""

from __future__ import print_function

import sys
import traceback

from argparse import ArgumentParser
from PIL import Image

USAGE = "%(prog)s [<args>]"
DESCRIPTION = "Convert images to ASCII art."
ASCII = "@w#$kdtji. "

def to_ascii(img):
    _width = 80
    _height = 0

    if img.size[0] >= _width:
        _height = int(img.size[1] * _width / img.size[0])
    else:
        _width = img.size[0]
        _height = img.size[1]

    pixs = img.resize((_width, _height)).convert('L').load()
    txt = ''

    for y in range(_height):
        for x in range(_width):
            txt += ASCII[int(pixs[x, y] / 25)]
        txt += '\n'

    print(txt)

def main():
    parser = ArgumentParser(usage=USAGE, description=DESCRIPTION)
    parser.add_argument('path', type=str,
                        help='path to image')

    args = parser.parse_args()

    try:
        with Image.open(args.path) as img:
            to_ascii(img)
    except IOError:
        pass

    return None

if __name__ == '__main__':
    main()
