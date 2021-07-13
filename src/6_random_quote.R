random_quote<-function(){
  d<-rjson::fromJSON(file  = "www/data.json")
  d[sample.int(length(d),1)]
}