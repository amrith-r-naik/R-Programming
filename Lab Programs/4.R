library(rvest)
library(xml2)
library(httr)
# Define the URL
url <-"https://lms.nmamit.in"
# If authentication is required, set your username and password
username <- "nnm22ad006@nmamit.in"
password <- "#deluX563"
# Send a GET request
response <- GET(url, authenticate(username, password))

# Specify the Target Website and URL
# url <- "https://coinmarketcap.com/"

# Send HTTP Requests and Handle Authentication (if required)
# response <- tryCatch(GET(url), error = function(e) e)

# Check if connection was successful
if (!inherits(response, "error")) {
  cat("Successfully connected to the website.\n")
  
  # Retrieve HTML Content and Parse XML/HTML
  html_content <- read_html(response$content, encoding = "UTF-8")
  
  # Extract Data from HTML
  # Extracting country names
  currency_names <- html_content %>%
    html_nodes(xpath="//*[@id='__next']/div[2]/div[1]/div[2]/div/div[1]/div[4]/table/tbody/tr/td[3]") %>%
    html_text()
  
  # Extracting capital names
  prices <- html_content %>%
    html_nodes(xpath="//*[@id='__next']/div[2]/div[1]/div[2]/div/div[1]/div[4]/table/tbody/tr/td[4]") %>%
    html_text()
  
  # Remove Unicode characters and symbols
  clean_currency_names <- enc2utf8(iconv(clean_currency_names, "UTF-8", "ASCII", sub = " "))
  clean_prices <- enc2utf8(iconv(clean_prices, "UTF-8", "ASCII", sub = " "))
  
  # Combine data into a data frame
  currency_prices <- data.frame(Currency = clean_currency_names, Price = clean_prices)
  
  # Save or Analyze the Extracted Data
  # Save the extracted data to a CSV file
  write.csv(currency_prices, file = "currency_prices.csv", row.names = FALSE)
} else {
  cat("Failed to connect to the website. Please check your internet connection or the URL.\n")
}