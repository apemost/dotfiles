#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Extract kindle deals from amazon.cn
"""

import sys
import traceback
import requests
import re

from argparse import ArgumentParser
from bs4 import BeautifulSoup

def _read(args):
    headers = {
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
        'Accept-Encoding': 'gzip, deflate, sdch',
        'Accept-Language': 'en-US,en;q=0.8,zh-CN;q=0.6,zh;q=0.4,ja;q=0.2',
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36'
    }

    s = requests.Session()
    s.headers.update(headers)

    url = 'https://www.amazon.cn'
    url_daily = url + '/gp/feature.html/?docId=126758'
    url_monthly = url + '/gp/feature.html/?docId=1491958'
    soup = None

    if args.daily or not (args.weekly or args.monthly):
        soup = BeautifulSoup(s.get(url_daily).text, 'lxml')
        titles = soup.select('.productTitle')
        authors = soup.select('.productByLine')
        prices = soup.select('.productPrice')
        print_deals('daily deals', (titles, authors, prices))

    if args.weekly:
        if not soup:
            soup = BeautifulSoup(s.get(url_daily).text, 'lxml')

        selector = '.acswidget-container'
        print_deals('weekly deals', get_deals(soup, selector))

    if args.monthly:
        soup = BeautifulSoup(s.get(url_monthly).text, 'lxml')
        selector = '.acswidget-carousel__carousel-container'
        print_deals('monthly deals', get_deals(soup, selector))

def get_deals(soup, selector):
    sel = soup.select(selector)

    if sel:
        titles = sel[0].select('.acs_product-title span')
        authors = sel[0].select('.acs_product-metadata__contributors')
        prices = sel[0].select('.acs_product-price span')
    else:
        sel = soup.select('.a-section.s9Widget')
        titles = sel[0].select('span.s9TitleText')
        authors = sel[0].select('div.a-row.a-size-small')
        prices = sel[0].select('span.s9Price')

    return titles, authors, prices

def print_deals(category, deals):
    titles, authors, prices = deals

    print(category + ':')
    print('')
    for i in range(len(titles)):
        print(titles[i].get_text(strip=True).encode('utf-8'))
        print(authors[i].get_text(strip=True).encode('utf-8'))
        print(prices[i].get_text(strip=True).encode('utf-8'))
        print('')

def main():
    usage = '%(prog)s [<args>]'
    description = 'Extract kindle deals from amazon.cn'
    parser = ArgumentParser(usage=usage, description=description)

    parser.add_argument('-d', '--daily', action='store_true',
                        help='extract kindle daily deals')
    parser.add_argument('-w', '--weekly', action='store_true',
                        help='extract kindle weekly deals')
    parser.add_argument('-m', '--monthly', action='store_true',
                        help='extract kindle monthly deals')

    args = parser.parse_args()

    _read(args)

    return None

if __name__ == '__main__':
    main()
