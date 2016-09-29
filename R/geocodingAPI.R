#APIkey = AIzaSyAlnsMjbJVxvOfiNO3YVAtkmgO78ah6zFk

#testcase = geocode_api("/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=AIzaSyAlnsMjbJVxvOfiNO3YVAtkmgO78ah6zFk")

#Directory setting for PC-room computers
.libPaths("C:/Users/Public/Temp")
Sys.setenv(R_LIBS_USER = "C:/Users/Public/Temp")
#Install necessary packages

devtools::use_package("httr")
devtools::use_package("jsonlite")
.libPaths("Z:/Documents/Semester1/AdvancedR/Lab5/ARP_Lab5/GeoCodeAPI")

geocode_api <- function(path) {
  #form API request
  url <- modify_url("https://maps.googleapis.com", path = path)

  #send request and put output in list (it will be of class "response")
  resp <- GET(url)
  #check if output is in required format (here JSON)
  if (http_type(resp) != "application/json") {
    stop("API did not return json format", call. = FALSE)
  }

  parsed <- jsonlite::fromJSON(content(resp, as = "text" ), simplifyVector = FALSE)

  #create S3 object to contain output
  structure(
    list(
      content = parsed,
      path = path,
      response = resp
    ),
    class = "geocode_api"
  )

}

print.geocode_api <- function(x, ...) {
  cat("<GeoCode", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}

