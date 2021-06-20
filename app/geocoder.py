#!/usr/bin/python
# -*- coding: UTF-8 -*-


"""
    Définition des routes de l'application
    author : Jean-Damien Généro
    date : 2021-06-19
    update : 
    https://programminghistorian.org/en/lessons/mapping-with-python-leaflet#making-geojson
    https://stackoverflow.com/questions/63231855/violation-user-agent-nominatim-python-gis
    https://discourse.psychopy.org/t/nameerror-name-io-is-not-defined/19567
"""

import geopy, sys
import pandas
from geopy.geocoders import Nominatim, GoogleV3


inputfile=str(sys.argv[1])
namecolumn=str(sys.argv[2])
# python geocoder.py ./static/csv/census-historic-population-borough.csv Area_Name


def main():
	io = pandas.read_csv('./static/csv/census-historic-population-borough.csv', index_col=None, header=0, sep=",")


	def get_latitude(x):
	  return x.latitude
	
	
	def get_longitude(x):
	  return x.longitude


	geolocator = Nominatim(user_agent="You", timeout=5)
	geolocate_column = io[namecolumn].apply(geolocator.geocode)
	io['latitude'] = geolocate_column.apply(get_latitude)
	io['longitude'] = geolocate_column.apply(get_longitude)
	io.to_csv('./static/csv/geocoding-output.csv')


if __name__ == '__main__':
  main()
