random_quote<-function(){
  jsonlite::fromJSON("https://api.taylor.rest/")[['quote']]
}