mybm <- read.csv("bm2.csv", sep = ";")

# fix Sara
mybm[4,2] = gsub(",00","",mybm[4,2])

# replace all "," to "."
mybmbu = mybm
mybmbu <- as.data.frame(lapply(mybmbu, function(x) gsub(",",".",x)))
mybmbu[3,8] <- 0
# fix Diana sortl
mybmbu[3,8] = 0
# fix Sara 
mybmbu[4,2] = gsub("\\.","",mybmbu[4,2])

# fix GHz
mybmbu$cpuhastighed_new <- unlist(lapply(mybmbu$cpuhastighed, function(x) as.numeric(gsub("GHz","",x))))

# fix ram
# create custom function
# if GB then remove GB, to numeric and to bytes
# else if small number then to numberic and to bytes
# else nothing
# then return bytes

mybmbu$ram2 <- (lapply(mybmbu$ram, tobytes ))
mybmbu$cpuhastighed_new <- unlist(lapply(mybmbu$cpuhastighed_new, FUN=is.double))

attach(mybmbu)
barplot(ram2 ~ user,las=2)
barplot(cpuhastighed_new ~ user,las=2)


tobytes <- function(input) {
  tmpval = 0
  if (grepl("GB",input) != 0) {
    tmpval <- as.numeric(gsub("GB","",input))
  tmpval <- tmpval*1024*1024*1024
  } else if (nchar(input) < 5) {
    tmpval <- as.numeric(input)
  tmpval <- tmpval*1024*1024*1024
  } else {
    tmpval <- as.numeric(input)
  }
  return(round(tmpval,0))
}
