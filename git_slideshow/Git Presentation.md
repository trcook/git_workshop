
<!--File must begin/end on empty line!!  -->

# Problems

## Three challenges with managing data

1. Long-term reproducability
3. Version management
2. Collaboration with others


- Let's talk about some common scenarios



## Long-term reproducability and Mysterious Data:

* Common Scenario:
  * Get novel data file
      * Make some changes to it
      * Save over original file
\pass{\center\includegraphics<2>[width=.25\framewidth]{HomerSimpson5.pdf}}



## Six months later...

* Return to project...
    * what does `log_inerv_1234.b` mean? How did I it? Why is it driving my results?
* Even worse if someone asks for your replication data
    * you need to be able to explain how you arrived at a given variable/model/etc
\pass{\center\includegraphics<2>[width=.25\framewidth]{homer-doh.png}}

---

### Partial Solution:

* Make R script, DO file or other script that generates data from pristine data files.
  * Ultimately, script should be parsimonious, simple:

---

Partial Solution:

* Make R script, DO file or other script that generates data from pristine data files.
  * Ultimately, script should be parsimonious, simple:


```
# -- building script. R --
# loading the file
x<-load('pristine_data/file.Rds')
# We need to log variable 2:
x$var2_logged<-log(x$var2)
final_model<-lm(var1~var2_logged,data=x)
# analysis over
```
---

Usually script looks more like this:

\fontsize{9}{10}\selectfont

```
# -- building script. R --
# loading the file
y<-load(barfoo.Rds)
# Hurry! Regress something:
require(earth)
momo1<-earth(y$var1~var2+6,data=y, weights=c(1:99-3)) # This will probably work
summary(momo1)
vcov(momo1)
# It didn't work. Hurry! do some other stuff:
apply(y,2,function(x){apply(x,2,sum))})
# Nothing is working!
print("nothing is working!")

# Ok, trying different datasource:
x<-load('pristine_data/file.Rds')
# We need to log variable 2:
x$var2_logged<-log(x$var2)
final_model<-lm(var1~var2_logged,data=x)
# analysis over
```

---

* We'd like to keep the simplified, ultimate file
* Should also keep record of prior attempts or prior routes of analysis taken
* Track changes over time









<!--File must begin/end on empty line!!  -->
