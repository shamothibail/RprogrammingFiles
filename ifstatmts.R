#conditional statements
n1=as.integer(readline(prompt="enter the first number:"))
n2=as.integer(readline(prompt="enter the second number:"))
if(n1>n2){
  print("number is positive")
}else{
  print("")
}

a <-604
b <-906
if(a>b){
  print("A is greater")
}else{
  print(paste("B is greater:",b))
}
#nested if
x<-41
if(x>10){
  print("above")
if(x>20){
  print("above 20")
}else{
  print("also not above 20")
}
}else{
  print("below 10")
}

