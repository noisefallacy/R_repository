#Importing and Managing Financial Data in R
##Introduction and Downloading Data

# Load the quantmod package
library(quantmod)

# Import QQQ data from Yahoo! Finance
getSymbols("QQQ", auto.assign = T)

# Look at the structure of the object getSymbols created
str(QQQ)

# Look at the first few rows of QQQ
head(QQQ)

# Import QQQ data from Alpha Vantage
getSymbols("QQQ", src="av", auto.assign = T)

# Look at the structure of QQQ
str(QQQ)

# Import GDP data from FRED
getSymbols("GDP", src="FRED",auto.assign = T)

# Look at the structure of GDP
str(GDP)

# Assign SPY data to 'spy' using auto.assign argument
spy <- getSymbols("SPY", auto.assign=F)

# Look at the structure of the 'spy' object
str(spy)

# Assign JNJ data to 'jnj' using env argument
jnj <- getSymbols('JNJ', env=NULL)

# Look at the structure of the 'jnj' object
str(jnj)

# Load the Quandl package
library(Quandl)
Quandl.api_key("bSmr7LzzmhMQyAGVkVzF")

# Import GDP data from FRED.
# For Quandl specify source with "code" (i.e. database/series).
gdp <- Quandl(code="FRED/GDP")

# Look at the structure of the object returned by Quandl
str(gdp)

# Import GDP data from FRED as xts
gdp_xts <- Quandl(code="FRED/GDP", type="xts")

# Look at the structure of gdp_xts
str(gdp_xts)

# Import GDP data from FRED as zoo
gdp_zoo <- Quandl(code="FRED/GDP", type="zoo")

# Look at the structure of gdp_zoo
str(gdp_zoo)

# Create an object containing the Pfizer ticker symbol
symbol <- "PFE"

# Use getSymbols to import the data
getSymbols(symbol, auto.assign=TRUE)

# Look at the first few rows of data
head(PFE)

#quantmod::oanda.currencies contains a 
#list of currencies provided by Oanda

# Create a currency_pair object
currency_pair <- "GBP/CAD"

# Load British Pound to Canadian Dollar exchange rate data
getSymbols(currency_pair, src="oanda")

# Examine object using str()
str(GBPCAD)

# Try to load data from 190 days ago
getSymbols(currency_pair, from = Sys.Date() - 190, to = Sys.Date(), 
           src = "oanda")

# Create a series_name object
series_name <- "UNRATE"

# Load the data using getSymbols
getSymbols(series_name, src="FRED")

# Create a quandl_code object
quandl_code <- paste("FRED",series_name,sep="/")

# Load the data using Quandl
unemploy_rate <- Quandl(quandl_code)
