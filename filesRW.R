# Getting and Setting the Working Directory
# Get and print current working directory.
print(getwd())

# Set current working directory.
setwd("/web/com")

# Get and print current working directory.
print(getwd())

# Reading a CSV File
data <- read.csv("C:\\Users\\ITPeople\\Documents\\mine\\R\\RLEarnings\\input.csv")
print(data)

# Analyzing the CSV File
data <- read.csv("C:\\Users\\ITPeople\\Documents\\mine\\R\\RLEarnings\\input.csv")

print(is.data.frame(data))
print(ncol(data))
print(nrow(data))

# Get the maximum salary
# Create a data frame.
data <- read.csv("C:\\Users\\ITPeople\\Documents\\mine\\R\\RLEarnings\\input.csv")

# Get the max salary from data frame.
sal <- max(data$salary)
print(sal)

# Get the details of the person with max salary
# Create a data frame.
data <- read.csv("C:\\Users\\ITPeople\\Documents\\mine\\R\\RLEarnings\\input.csv")

# Get the max salary from data frame.
sal <- max(data$salary)

# Get the person detail having max salary.
retval <- subset(data, salary == max(salary))
print(retval)

# Get all the people working in IT department
# Create a data frame.
data <- read.csv("C:\\Users\\ITPeople\\Documents\\mine\\R\\RLEarnings\\input.csv")

retval <- subset( data, dept == "IT")
print(retval)

# Get the persons in IT department whose salary is greater than 600
# Create a data frame.
data <- read.csv("C:\\Users\\ITPeople\\Documents\\mine\\R\\RLEarnings\\input.csv")

info <- subset(data, salary > 600 & dept == "IT")
print(info)

# Get the people who joined on or after 2014
# Create a data frame.
data <- read.csv("C:\\Users\\ITPeople\\Documents\\mine\\R\\RLEarnings\\input.csv")

retval <- subset(data, as.Date(start_date) > as.Date("2014-01-01"))
print(retval)

# Writing into a CSV File
# Create a data frame.
data <- read.csv("C:\\Users\\ITPeople\\Documents\\mine\\R\\RLEarnings\\input.csv")
retval <- subset(data, as.Date(start_date) > as.Date("2014-01-01"))

# Write filtered data into a new file.
write.csv(retval,"output.csv")
newdata <- read.csv("output.csv")
print(newdata)

# Dropping column X created from above dataframe
# Create a data frame.
data <- read.csv("input.csv")
retval <- subset(data, as.Date(start_date) > as.Date("2014-01-01"))

# Write filtered data into a new file.
write.csv(retval,"output.csv", row.names = FALSE)
newdata <- read.csv("output.csv")
print(newdata)

# Reading XML File
# Load the package required to read XML files.
library("XML")

# Also load the other required package.
library("methods")

# Give the input file name to the function.
result <- xmlParse(file = "input.xml")

# Print the result.
print(result)

# Get Number of Nodes Present in XML File
# Load the packages required to read XML files.
library("XML")
library("methods")

# Give the input file name to the function.
result <- xmlParse(file = "input.xml")

# Exract the root node form the xml file.
rootnode <- xmlRoot(result)

# Find number of nodes in the root.
rootsize <- xmlSize(rootnode)

# Print the result.
print(rootsize)

# Details of the First Node
# Load the packages required to read XML files.
library("XML")
library("methods")

# Give the input file name to the function.
result <- xmlParse(file = "input.xml")

# Exract the root node form the xml file.
rootnode <- xmlRoot(result)

# Print the result.
print(rootnode[1])

# Get Different Elements of a Node
# Load the packages required to read XML files.
library("XML")
library("methods")

# Give the input file name to the function.
result <- xmlParse(file = "input.xml")

# Exract the root node form the xml file.
rootnode <- xmlRoot(result)

# Get the first element of the first node.
print(rootnode[[1]][[1]])

# Get the fifth element of the first node.
print(rootnode[[1]][[5]])

# Get the second element of the third node.
print(rootnode[[3]][[2]])

# XML to Data Frame
# Load the packages required to read XML files.
library("XML")
library("methods")

# Convert the input xml file to a data frame.
xmldataframe <- xmlToDataFrame("input.xml")
print(xmldataframe)

#Read the JSON File
# Load the package required to read JSON files.
library("rjson")

# Give the input file name to the function.
result <- fromJSON(file = "input.json")

# Print the result.
print(result)

# Convert JSON to a Data Frame
# Load the package required to read JSON files.
library("rjson")

# Give the input file name to the function.
result <- fromJSON(file = "input.json")

# Convert JSON file to a data frame.
json_data_frame <- as.data.frame(result)

print(json_data_frame)

# Web data
# Read the URL.
url <- "http://www.geos.ed.ac.uk/~weather/jcmb_ws/"

# Gather the html links present in the webpage.
links <- getHTMLLinks(url)

# Identify only the links which point to the JCMB 2015 files.
filenames <- links[str_detect(links, "JCMB_2015")]

# Store the file names as a list.
filenames_list <- as.list(filenames)

# Create a function to download the files by passing the URL and filename list.
downloadcsv <- function (mainurl,filename) {
  filedetails <- str_c(mainurl,filename)
  download.file(filedetails,filename)
}

# Now apply the l_ply function and save the files into the current R working directory.
l_ply(filenames,downloadcsv,mainurl = "http://www.geos.ed.ac.uk/~weather/jcmb_ws/")

