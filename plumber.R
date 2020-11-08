library(plumber)
library(tidyverse)

crop_yields <- read_csv("data/crop_yields.csv")

#* @apiTitle Crop Yields API

#* Return crop yields for a given product, year, and entity. 
#* @param .year The year of interest (1961 - 2018)
#* @param .product The crop of interest. One of wheat, rice, maize, soybeans, potatoes, beans, peas, cassava, barley, cocoa beans, or bananas.
#* @param .entity The country of interest. 
#* @get /crop-yield

function(.year, .product, .entity) {
  
  filter(crop_yields,
         year == .year,
         product == .product,
         entity == .entity) 
  
}
