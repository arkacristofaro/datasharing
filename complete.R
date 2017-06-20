complete <- function(directory, id=1:332) {
        df<- data.frame(id=numeric(), nobs=numeric())
        for (i in id) {
             if (i<10)                     
                 con <- file(paste(directory[1],"00",i,".csv", sep=""))   
             else {
                     if(i>=10 && i<100)
                             con <- file(paste(directory[1],"0",i,".csv", sep=""))
                     else 
                             con <- file(paste(directory[1],i,".csv", sep=""))
             }
             open(con,"r")
             y <- read.csv(con)
             ##print(y)
             ##z<- subset(y, !is.na(y$sulfate) & !is.na(y$nitrate))
             g<- sum(complete.cases((y)))
             h<-data.frame(i,g)
             names(h) <- c("id","nobs")
             df <- rbind(df,h)
             ##print(paste(g,i))
        }
        print(df)
        
}