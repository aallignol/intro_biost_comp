#!/usr/bin/python

import json
import urllib2
import sys
import argparse
import numpy as np
import pandas as pd
import datetime

parser = argparse.ArgumentParser(description="Get velib data")
parser.add_argument('-a', '--apikey',
                    help = 'api-key for accessing JCDecaux dev page',
                    required = True)
parser.add_argument('-c', '--contract',
                    help = 'From which contract to get data',
                    default = 'Paris')
args = parser.parse_args()
contract = args.contract
api_key = args.apikey

my_url = "https://api.jcdecaux.com/vls/v1/stations?contract=" + contract + "&apiKey=" +api_key

r = urllib2.urlopen(my_url)

in_data = json.load(r)

# Get the actual date
actual_time = datetime.datetime.now()

# transform the dict position into 'variables'
for i in in_data:
    i[u'latitude'] = i['position']['lat']
    i[u'longitude'] = i['position']['lng']
    del i['position']
    del i['last_update']
    i[u'last_update'] = actual_time.strftime('%Y/%m/%d %H:%M:%S')

velib_data = pd.DataFrame.from_dict(in_data)

data_name = "/home/arthur/Documents/Ulm/Teaching/SS_2015/intro_biostat_comp/exam/velib/data/velib_data_" + actual_time.strftime('%Y_%m_%d_%H_%M') + ".csv"

velib_data.to_csv(data_name, encoding = 'utf-8')
