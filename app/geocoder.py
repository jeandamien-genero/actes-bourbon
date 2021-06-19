#!/usr/bin/python
# -*- coding: UTF-8 -*-


"""
    Définition des routes de l'application
    author : Jean-Damien Généro
    date : 2021-06-19
    update : 
"""

import geopy
import pandas
from geopy.geocoders import Nominatim, GoogleV3


def main():
	io = pandas.read_csv('static/csv/census-historic-population-borough.csv', index_col=None, header=0, sep=",")


def get_latitude(x):
  return x.latitude


def get_longitude(x):
  return x.longitude
