#Importing and Managing FInancial Data in R
##Extracting and transforming data

library(quantmod)
library(Quandl)
Quandl.api_key("bSmr7LzzmhMQyAGVkVzF")

#While it's not necessary to complete the exercise, you can learn 
#more about all the extractor functions from help("OHLC.Transformations")

DC <- getSymbols("PFE", auto.assign=F)

# Extract the close column
dc_close <- Cl(DC)

# Look at the head of dc_close
head(dc_close)

# Extract the volume column
dc_volume <- Vo(DC)

# Look at the head of dc_volume
head(dc_volume)

# Extract the high, low, and close columns
dc_hlc <- HLC(DC)

# Look at the head of dc_hlc
head(dc_hlc)

# Extract the open, high, low, close, and volume columns
dc_ohlcv <- OHLCV(DC)

# Look at the head of dc_ohlcv
head(dc_ohlcv)

# Download CME data for CL and BZ as an xts object
oil_data <- Quandl(code = c("CME/CLH2016", "CME/BZH2016"), type = "xts")

# Look at the column names of the oil_data object
colnames(oil_data)

# Extract the Open price for CLH2016
cl_open <- getPrice(oil_data, symbol = "CLH2016", prefer = "Open$")

# Look at January, 2016 using xts' ISO-8601 subsetting
cl_open["2016-01"]

# Download quarterly CL and BZ prices
qtr_price <- Quandl(code=c("CME/CLH2016","CME/BZH2016"), 
                    type="xts", collapse="quarterly")

# View the high prices for both series
Hi(qtr_price)

# Download quarterly CL and BZ returns
qtr_return <- Quandl(code=c("CME/CLH2016","CME/BZH2016"), 
                     type="xts", collapse="quarterly", transform="rdiff")

# View the settle price returns for both series
getPrice(qtr_return, prefer="Settle")

# Call head on each object in data_env using eapply
data_env <- new.env()
data_list <- eapply(data_env,head)

# Merge all the list elements into one xts object
data_merged <- do.call(merge,data_list)

# Ensure the columns are ordered: open, high, low, close
data_ohlc <- OHLC(data_merged)

# Symbols
symbols <- c("AAPL", "MSFT", "IBM")

# Create new environment
data_env <- new.env()

# Load symbols into data_env
getSymbols(symbols,env=data_env)

# Extract the close column from each object and combine into one xts object
close_data <- do.call(merge, eapply(data_env, Cl))

# View the head of close_data
head(close_data)