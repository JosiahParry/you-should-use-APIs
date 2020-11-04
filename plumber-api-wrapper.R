library(httr)


# Query API w/out function ------------------------------------------------

query_url <- modify_url(
  url = "https://colorado.rstudio.com/rsc/crop-yield-api/crop-yield",
  # these are the parameters that are sent to the API end point 
  # this will become function arguments 
  query = list(year = 1999, product = "maize", entity = "united states")
)

# we want to send the query
res <- POST(query_url)

# parse the query response as text so we get the raw json
res_json <- content(res, as = "text")

# read the json 
jsonlite::fromJSON(res_json)



# Create plumber API wrapper  ---------------------------------------------


# to turn it into a function 
get_crop_yields <- function(.year, .product, .entity) {
  query_url <- modify_url(
    url = "https://colorado.rstudio.com/rsc/crop-yield-api/crop-yield",
    # these are the parameters that are sent to the API end point 
    # this will become function arguments 
    query = list(year = .year, product = .product, entity = .entity)
  )
  
  res <- POST(query_url)
  res_json <- content(res, as = "text")
  jsonlite::fromJSON(res_json)
  
}


get_crop_yields(2012, "beans", "mexico")
