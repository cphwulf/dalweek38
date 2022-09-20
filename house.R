library(eurostat)

toc <- get_eurostat_toc()

### filter toc for house with logical vector
tochousev <- subset(toc, toc$title %like% "sale" ) 
tt <- search_eurostat("sales")
# on dates
toc$ndate <- as.Date(toc$`last update of data`,format="%d.%m.%Y")
tochclean = subset(toc,!is.na(toc$ndate))

# huspriser for dk, es og hu ud fra prc_hpi_hsna
dfhpiq <- get_eurostat(id = "prc_hpi_hsna")
dfhpisel2 <- subset(dfhpiq,dfhpiq$geo %in% c("DK","HU","ES") & dfhpiq$unit=="INX_A_AVG")


# plot
plot(givecountry("DK")$time,givecountry("DK")$values,  las=2, col="red", pch=16, 
     main="Huspriser",
     type = "b",
     ylab = "values (index, 100=2015)",
     xlab = "year"
)
points(givecountry("ES")$time, givecountry("ES")$values, col='orange',pch=16)
lines(givecountry("ES")$time, givecountry("ES")$values, col='orange')
lines(givecountry("HU")$time, givecountry("HU")$values, col='green', pch=16)
points(givecountry("HU")$time, givecountry("HU")$values, col='green', pch=16)

legend(x="topleft", legend=c("DK","ES","HU"),
       fill = c("red","green","blue"),bg ="lightblue",
       text.font=3
)

givecountry <- function(country) {
  dfretval <- subset(dfhpisel2,dfhpisel2$geo==country)
  return(dfretval)
}
