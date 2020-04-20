con<-GNI2014
str(con)
png(filename="treemap.png",600,400)
treemap(con, vSize="population", index=c("continent","iso3"), title="전세계 인구정보", 
        fontfamily.title="lett",fontfamily.labels = "lett",fontfamily.legend = "lett" )

dev.off()

  