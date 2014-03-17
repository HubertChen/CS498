# CS498 Python Project: Create RSS feed of CSSE Department News
#
# Create an RSS feed for the Computer Science/Software Engineering news page
import re
import urllib2

# Takes a snippet of code and parses it to return only the title, description and link
def extractData(article):
	descriptions = ""

	# Cleans data, removes excess information
	article = re.sub(r"<div (?:.*)>(?:.*)</div>", "", article, 0, re.DOTALL) # Removes picture, picture commment
	link = re.search(r"<a name=\"(.*?)\">", article, re.DOTALL)
	article = re.sub(r"<p.*?</p>", "", article, 1, re.DOTALL) # Removes date header
	
	# Saves title, then deletes it. Then saves description
	title = re.search(r"<strong>(.*?)</strong>", article, re.DOTALL)
	article = re.sub(r"<p><strong>.*?</strong></p>", "", article, 1, re.DOTALL)

	# Saves title and descriptions if there is one
	if title is not None:
		title = title.group(1)
		title = title.lstrip()
		title = title.rstrip()
		title = removeTags(title)
	if descriptions is not None:
		description = removeTags(article) # Filters tags
		description = re.sub(r"Read .*...", "", description, 0, re.DOTALL) # Removes "Read Me..."
		description = re.sub(r"\xc2\xa0", "", description, 0, re.DOTALL) # Removes new line characters
		description = description.lstrip() # Left strip
		description = description.rstrip() # Right strip
	if link is not None:
		link = link.group(1)
		link = link.rstrip()
		link = link.lstrip()

	return (title, description, link)

# Removes tags within a string (e.g., Some strings have <em> tags)
def removeTags(string):
	return re.sub(r"<.*?>", "", string, 0, re.DOTALL)

# Prints the RSS feed
def saveToFile(articles, fileName):
	outputFile = open(fileName, "w")

	outputFile.write("<?xml version=\"1.0\"?>\n")
	outputFile.write("<rss version=\"2.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\">\n")
	outputFile.write("<channel>\n")
	outputFile.write("<atom:link href=\"http://rockhopper.monmouth.edu/~s0792262/cssenews.rss.xml\" rel=\"self\" type=\"application/rss+xml\" />\n")
	outputFile.write("<description>Monmouth U. CSSE Dept. News Feed</description>\n")
	outputFile.write("<link>http://www.monmouth.edu/academics/CSSE/news.asp</link>\n")
	outputFile.write("<title>Monmouth U. CSSE Dept. News Feed</title>\n")

	for article in articles:
		(title, description, link)  = extractData(article)
		outputFile.write("<item>\n")
		outputFile.write("<guid>http://www.monmouth.edu/academics/CSSE/news.asp#" + link + "</guid>\n")
		outputFile.write("<title>" + title + "</title>\n")
		outputFile.write("<link>http://www.monmouth.edu/academics/CSSE/news.asp#" + link + "</link>\n")
		outputFile.write("<description>" + description + "</description>\n")
		outputFile.write("</item>\n")

	outputFile.write("</channel>\n")
	outputFile.write("</rss>\n")

	outputFile.close()

webAddress = "http://www.monmouth.edu/school-of-science/news-and-events.aspx"
htmlCode = urllib2.urlopen(webAddress).read()
fileOutputName = "cssenews.rss.xml"

articles = re.findall(r"</div>(.*?)<div><hr />", htmlCode, re.DOTALL) # Returns a snippet of HTML Code that can be further processed
articles = articles[1:] # Removes the header 

saveToFile(articles, fileOutputName)
