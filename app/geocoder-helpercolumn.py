#!/usr/bin/python
# -*- coding: UTF-8 -*-


"""
    Définition des routes de l'application
    author : Jean-Damien Généro
    date : 2021-06-19
    update : 
"""

import geopy, sys
import pandas
from geopy.geocoders import Nominatim, GoogleV3


inputfile=str(sys.argv[1])
# namecolumn=str(sys.argv[2])
# python geocoder.py ./static/csv/census-historic-population-borough.csv Area_Name
# python geocoder-helpercolumn.py ./static/csv/census_country.csv


def main():
	io = pandas.read_csv(inputfile, index_col=None, header=0, sep=",")


	def get_latitude(x):
	  return x.latitude
	
	
	def get_longitude(x):
	  return x.longitude


	# geolocator = GoogleV3(timeout=5)
	geolocator = Nominatim(user_agent="Your_app-name", timeout=5)
	# uncomment the geolocator you want to use
	# change the timeout value if you get a timeout error, for instance, geolocator = Nominatim(timeout=60)
	io['helper'] = io['Area_Name'].map(str) + " " + io['Country'].map(str)
	geolocate_column = io['helper'].apply(geolocator.geocode)
	io['latitude'] = geolocate_column.apply(get_latitude)
	io['longitude'] = geolocate_column.apply(get_longitude)
	io.to_csv('./static/csv/geocoding-output-helper.csv')


if __name__ == '__main__':
  main()
