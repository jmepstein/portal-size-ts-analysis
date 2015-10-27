get_data<- function(){
  data<- read.csv("mammal_surveys.csv")
  return(data)
}

get_size_class<- function(weight, threshold){
  if (weight > threshold){
    size_class<- "large"
  }
  else{
    size_class<- "small"
  }
  return(size_class)
}