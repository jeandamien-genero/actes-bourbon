#!/usr/bin/python
# -*- coding: UTF-8 -*-


"""
    author : Jean-Damien Généro
    date : 2021-06-19
    update : 2021-06-20
    https://programminghistorian.org/en/lessons/mapping-with-python-leaflet#making-geojson
    https://stackoverflow.com/questions/63231855/violation-user-agent-nominatim-python-gis
    https://discourse.psychopy.org/t/nameerror-name-io-is-not-defined/19567
"""


import csv
import pandas
import sys
import time
from geopy.geocoders import Nominatim
from lxml import etree


# --- 1684.781737089157 seconds ---
# --- 29.02382183074951 seconds ---
# --- 34.88129997253418 seconds ---
# --- 35.68276405334473 seconds ---
# --- 34.803929805755615 seconds ---
# --- 34.649669885635376 seconds ---
# python geo-map.py ./static/csvlocorum.csv ./static/xml/locorum2.xml

csvfile=str(sys.argv[1])
xmlfile=str(sys.argv[2])


def get_cities(xmlfile):
	""" Making XPath requests on a xml file's <settitngDesc>
	and returns a dict with city names and their localisations.
	:param xmlfile: path to an xml file with a <settitngDesc>
	:type xmlfile: str
	:return: a dict where {<cityname>: [<settlement>, <departement>, <country>]}
	:rtype: dict
	"""
	xml = etree.parse(xmlfile)
	for item in xml.xpath("//settingDesc"):
		# 1a/ places with name + region
		cities = xml.xpath("//place[@type='place']/placeName/name[@xml:lang='fr']/text()")
		regions = xml.xpath("//place[@type='place']/placeName/region[@type='departement']/text()")
		countries = xml.xpath("//place[@type='place']/placeName/country/text()")
		# 1b/ places with name + settlement + region
		incities = xml.xpath("//settlement/ancestor::place[@type='incity']//name[@xml:lang='fr']/text()")
		inregions = xml.xpath("//settlement/ancestor::place[@type='incity']//region[@type='departement']/text()")
		incountries = xml.xpath("//settlement/ancestor::place[@type='incity']//country/text()")
		insettlements = xml.xpath("//place[@type='incity']/placeName/settlement[@type='city']/text()")
	# 2a/ making a list with [inregion, insettlement, incountries]
	insttlmts_inrgs_incntrs = []
	counter = -1
	while counter != len(inregions):
		counter += 1
		try:
			insttlmts_inrgs_incntrs.append([insettlements[counter], inregions[counter], incountries[counter]])
		except IndexError:
			continue
	# 2b/ making a list with [regions, countries]
	cities_regions_countries = []
	counter = -1
	while counter != len(regions):
		counter += 1
		try:
			cities_regions_countries.append([cities[counter], regions[counter], countries[counter]])
		except IndexError:
			continue
	# 3/ Making two dicts : <city>: ["", <region>, <country>] and <city> : [<region>, <settlement>, <country>]
	citydict = {cities[item]: cities_regions_countries[item] for item in range(len(cities))}
	incitydict = {incities[item]: insttlmts_inrgs_incntrs[item] for item in range(len(incities))}
	# 5/ Merging two dicts and returning a single dict
	citydict.update(incitydict)
	return citydict



def make_csv(csvfile):
	"""
	Making a csv file with four columns out of a dict where
	{<cityname>: [<settlement>, <departement>, <country>]}
	:param csvfile: path to a csvfile that will be written.
	:type csvfile:str
	:return: a csv file
	:r type: str
	"""
	with open(csvfile, 'w', encoding="utf-8") as openedcsv:
		spamwriter = csv.writer(openedcsv)
		headers = ["PlaceName", "Settlement", "Region", "Country"]
		spamwriter.writerow(headers)
		citydict = get_cities(xmlfile)
		for city in citydict:
			row = [city, citydict[city][0], citydict[city][1], citydict[city][2]]
			spamwriter.writerow(row)
	return csvfile


def getting_coordinates() -> None:
	"""
	Getting geographics coordinates with Nominatim search engine
	and writting them in a csv output file with 
	"""
	start_time = time.time()
	io = pandas.read_csv(make_csv(csvfile), index_col=None, header=0, sep=",")
	print(io)


	def get_latitude(x):
	  return x.latitude
	
	
	def get_longitude(x):
	  return x.longitude


	geolocator = Nominatim(user_agent="You", timeout=5)
	io['helper'] = io['Settlement'].map(str) + " " + io['Region'].map(str) + " " + io['Country'].map(str)
	io.to_csv("./output.csv")
	geolocate_column = io['helper'].apply(geolocator.geocode)
	io['latitude'] = geolocate_column.apply(get_latitude)
	io['longitude'] = geolocate_column.apply(get_longitude)
	io.to_csv("./static/csv/locorum_output.csv")
	print("--- %s seconds ---" % (time.time() - start_time))


getting_coordinates()
