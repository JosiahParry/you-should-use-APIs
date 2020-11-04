#
# This is a Plumber API. You can run the API by clicking
# the 'Run API' button above.
#
# Find out more about building APIs with Plumber here:
#
#    https://www.rplumber.io/
#

library(plumber)
library(tidyverse)

crop_yields <- read_csv("data/crop_yields.csv")

#* @apiTitle Crop Yields API


#* Return crop yields for a given product, year, and entity. 
#* 
#* @param year The year of interest (1961 - 2018)
#* @param product The crop of interest. One of wheat, rice, maize, soybeans, potatoes, beans, peas, cassava, barley, cocoa beans, or bananas.
#* @param entity The country of interest. 
#* 
#* @post /crop-yield
function(year, product, entity) {
  # using periods so there is no confusion between argument name and columns!
  # casting as the proper data type to be safe! 
  
  .year <- as.integer(year)
  .product <- tolower(product)
  .entity <- tolower(entity)
  
  filter(crop_yields,
         year == .year,
         product == .product,
         entity == .entity) 
}
