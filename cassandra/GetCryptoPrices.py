#!/usr/bin/python

import requests
import datetime
import os

mkdir -p home/Bittrex
os.chdir('home/Bittrex')

def timeStamped(fname, fmt='%Y-%m-%d-%H-%M-%S_{fname}'):
    return datetime.datetime.now().strftime(fmt).format(fname=fname)

bittrex = requests.get("https://bittrex.com/api/v1.1/public/getmarketsummaries")

with open(timeStamped('Bitrex_GetMarketSummaries.json'),'w') as outf:
    outf.write(bittrex.content)



mkdir -p home/Coinbase
os.chdir('home/Coinbase')

def timeStamped(fname, fmt='%Y-%m-%d-%H-%M-%S_{fname}'):
    return datetime.datetime.now().strftime(fmt).format(fname=fname)

coinbaseUSD = requests.get("https://api.coinbase.com/v2/prices/spot?currency=USD")
coinbaseEUR = requests.get("https://api.coinbase.com/v2/prices/spot?currency=EUR")

with open(timeStamped('CoinbaseUSD.json'),'w') as outf:
    outf.write(coinbaseUSD.content)

with open(timeStamped('CoinbaseEUR.json'),'w') as outf:
    outf.write(coinbaseEUR.content)






## bitcoin price for on a website example
#from coinbase.wallet.client import Client

#client = Client('PVRKDcQVEga2k7i1', 'REfXTeFKax6z3M4NcNRQgBqGL8lt0x35', api_version='YYYY-MM-DD')

#currency_code = 'USD'  # can also use EUR, CAD, etc.

# Make the request
#price = client.get_spot_price(currency=currency_code)

#print 'Current bitcoin price in %s: %s' % (currency_code, price.amount)
