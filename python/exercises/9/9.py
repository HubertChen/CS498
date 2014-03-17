# CS498 Exercise 9: Regular Expression & HTML Parsing
#
# Scrape the titles and URLs from "http://technews.acm.org/"
# Use a dictionary to store the title -> URL as the key:value pair
import re
import urllib2

webAddress = "http://technews.acm.org"
htmlCode = urllib2.urlopen(webAddress).read()
dictionary = {}

# Saves a list of article titles and links to their full page
titles = re.findall(r"<b>(.*)</b>", htmlCode)
articleURLs = re.findall(r"<a href=\"(.*)\" .*\".*View Full Article", htmlCode)

# Creates a hash with a key:value of title:url
articles = {}
count = 0
for title in titles:
	if title == titles[0]: # Avoid the header
		continue
	if count < len(articleURLs):
		articles[title] = articleURLs[count]
	count = count + 1

# Prints key:value 
print articles.items()
