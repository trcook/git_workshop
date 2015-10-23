require(foreign)

x<-runif(100,0,1)
y<-rnorm(100,x,1)
z<-rnorm(100,x+y,1)

### Some other stuff

dat<-read.csv("./pristine/state_data_2.csv")

summary(dat)
ls(dat)
apply(dat,2,summary)
summary(glm(as.factor(party)~fed_need+openness,family=binomial,data=dat))
#'' eh? this data is weird


#' Upon further inspection, there are too many states:
length(dat[,1])
