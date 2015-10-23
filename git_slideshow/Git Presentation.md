
<!--File must begin/end on empty line!!  -->

# Problems and Caution

## Long-term reproducability and Mysterious Data:

* Common Scenario:
  * Get novel data file
      * Make some changes to it
      * Save over original file
\pass{\center\includegraphics<2>[width=.25\framewidth]{figures/HomerSimpson5.pdf}}



## Six months later...

* Return to project...
    * What does `log_inerv_1234.b` mean? How did I get it? Why is it driving my results?
* Even worse if someone asks for your replication data
    * You need to be able to explain how you arrived at a given variable/model/etc
* Moar worse if your co-author created `log_inerv_1234.b`

\begin{pass}
\begin{center}
\includegraphics<2->[width=.25\framewidth]{figures/homer-doh.png}

\end{center}
\begin{itemize}
\item<3> Make R script, DO file or other script that generates data from pristine data files.
\end{itemize}
\end{pass}

## Two big challenges with managing data

1. Track file changes over tiem
    * Long-term reproducibility
    * Version management
2. Collaboration with others

## Common Solutions:

5. Edit data in-place (!)
1. Dropbox
2. Track Changes/time-machine
3. Email
4. New folder per version


## That's a start...

### But what about these other nightmare scenarios:

>* Someone asks for old version of replication data
* Coauthor deletes files in his/her dropbox folder
* You and co-author try to work on data at the same time (the dreaded `conflited copy`)
* Need to identify how project today differs from version 6 months ago
* Need to identify prior/abandoned approaches to analysis
* The list goes on...
>* Git can help resolve all of these



# What is Git?

## Git is...

>* Distributed Version Control System
    * Distributed $\rightarrow$ decentralized, many users
    * Version Control $\rightarrow$ track changes, enable rollbacks,
    * System $\rightarrow$ System
>* Think: "Track changes" on steroids



## Repos

* Git tracks sets of files -- multiple files at once
* Folder with set of files tracked by Git: Repository
    * Generally, a Git repo looks and works just like a folder
* Think: Repo $\righarrow$ project

## Commits


\begin{pass}
\only<1,5,8>{\begin{itemize}
\item A snapshot of (specified) files tracked by Git
\begin{itemize}
\item <1,5>Captures \emph{changes} in specified files (since last commit)
\item <5> Captures Files Added/Removed/Moved
\item <8> Upshot: Can track file changes very closely over time
\end{itemize}
\end{itemize}}
\begin{center}
\includegraphics<2>[height=.75\paperheight]{figures/commit1.eps}
\includegraphics<3>[height=.75\paperheight]{figures/commit2.eps}
\includegraphics<4>[height=.75\paperheight]{figures/commit3.eps}
\includegraphics<6>[height=.75\paperheight]{figures/commit4.eps}
\includegraphics<7>[height=.75\paperheight]{figures/commit5.eps}
\end{center}

\end{pass}

## Distribution/Collaboration

\begin{pass}
\only<1,6>{
\begin{itemize}
    \item <1,6>Git enables Collaboration -- it is a distributed system.
    \begin{itemize}
        \item <1>Contrast to Dropbox
        \item <6>Download repo to local computer
        \item <6>Make changes and commit
        \item <6>Push changes to server when ready
        \item <6>Pull changes from server when ready
    \end{itemize}
\end{itemize}
}
\begin{center}
\includegraphics<2>[height=.70\paperheight]{./figures/dropbox1.eps}
\includegraphics<3>[height=.70\paperheight]{./figures/dropbox2.eps}
\includegraphics<4>[height=.70\paperheight]{./figures/dropbox3.eps}
\includegraphics<5>[height=.70\paperheight]{./figures/dropbox4.eps}
\includegraphics<7>[height=.75\paperheight]{./figures/github1.eps}
\includegraphics<8>[height=.75\paperheight]{./figures/github2.eps}
\includegraphics<9>[height=.75\paperheight]{./figures/github3.eps}
\includegraphics<10>[height=.75\paperheight]{./figures/github4.eps}
\end{center}
\end{pass}

## Other things Git does
* Roll-back to previous versions
* Branch development/management
* Integration in to lots of software
* Best way to explore: start using git

# Using Git

## Today
* Sourcetree
    * Setup Repo
    * Clone Repo
    * Checkout
    * Commit
    * Pull

## Where to get help
* Easy help
    * Lots of places
    * Stackoverflow.com
    * Google
    * [Github youtube channel](https://www.youtube.com/user/GitHubGuides?&ab_channel=GitHubTraining&Guides)
    * Sourcetree help
* Punching deck and interactive learning:
    * [try.github.io](try.github.io)
    * [www.codeschool.com/courses/git-real](https://www.codeschool.com/courses/git-real)
    * [A great course at lynda.com www.lynda.com/Git-tutorials/Git-Essential-Training/100222-2.html](http://www.lynda.com/Git-tutorials/Git-Essential-Training/100222-2.html)
* Deep Dive
    * [pro-git book by Scott Chacon and Ben Straub. -- Free online http://git-scm.com/book/en/v2](http://git-scm.com/book/en/v2)

# Caveats

## Things Git is bad at

* Tracking binary files -- word files, images, etc. It will track them, but it's not ideal


## Merge Conflicts
* Git is good at fixing conflicts
* When it can't you need to fix merge conflicts
* Diff, resolve using 'mine'/'theirs'
    * Remember in Sourcetree: HEAD = 'mine'
    * External diff tools can help you cherry pick what to keep in a diff-merge
    * [Meld](http://meldmerge.org) on Windows(?)
    * On OS X, file-merge is included with xcode


# Bonus Git Stuff:
## What else can Git Do
* It works with rstudio
* Packages for atom and sublime
* You can use it to power a website

\appendix

# Replication environments
## Problem:
* Software versions change over time

# What is Docker?

## That's actually sort of a hard question to answer
* Virtualization software, but not totally
* But sort of if on pc/mac (needs to run in vbox -- but still snappy)


<!--File must begin/end on empty line!!  -->
