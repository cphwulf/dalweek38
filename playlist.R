# play with list
car0 <- list(make="bmw",model="745i",price=500, rentals=list())
car1 <- list(make="bmw",model="745i",price=500, rentals=list())
car2 <- list(make="bmw",model="320i",price=200,rentals=list())
car5 <- list(make="honda",model="civic",price=100,rentals=list())
car3 <- list(make="bmw",model="735csi",price=800,rentals=list())
car4 <- list(make="bmw",model="735csi",price=800,rentals=list())
car4 <- list(make="volvo",model="v70",price=800, rentals=list("Otto","Verner","Anton"))
#car4 <- list(make"="volvo",model"="v70","price"=800, "rentals"=list("Otto","Verner","Anton"))
cars <- list(car1,car4,car3,car2,car5)
#jcars <- jsonlite::toJSON(cars,pretty=TRUE,auto_unbox=TRUE)
#str(jcars)

df = data.frame()
#dfcars <- as.data.frame(do.call(rbind,cars))
for (car in cars) {
  c <- paste(car$rentals, collapse = ",")
  car['rentals']=c
  tmp <- rbind(car)
  print(c("GOT: ",paste(tmp, collapse = ",")))
  df <- rbind(df,tmp)
}
df <- as.data.frame(df)



