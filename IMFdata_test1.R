#IMF Data with R
# install.packages("imfr")
# install.packages("ggplot2")

library(imfr)
real_ex <- imf_data(database_id = 'IFS', indicator = 'LP_PE_NUM',
                    country = c('JP', 'NP', 'VN'), freq = 'A',
                    start = 2000, end = current_year())

library(ggplot2)
library(ggthemes)
library(extrafont)

library(tidyr)
real_ex$year <- as.numeric(as.character(real_ex$year)) 
p1 = ggplot(aes(y = LP_PE_NUM, x = year, colour = iso2c), data = real_ex) +
  geom_line()
p1
