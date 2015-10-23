require(foreign)

m=if(Sys.info()[['sysname']]=="Linux"){0}else{1}

x<-runif(100,0,1);y<-rnorm(100,x,1);z<-rnorm(100,x+y,1)

### Some other stuff

dat<-read.csv("./pristine/state_data_2.csv")
#' need to remove washington dc
dat<-dat[-which(dat$State=="District of Columbia"),]
dat
summary(glm(as.factor(party)~fed_need+openness,family=binomial,data=dat))
# Looks right to me

# some other part of a project
len(x+y+z)


quit(save='no',status=m)
