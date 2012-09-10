![Total Impact](https://raw.github.com/ropensci/rTotalImpact/master/total_impact.png) 
# rTotal Impact 
[Total Impact](http://total-impact.org/) is an effort to generate realtime metrics (aka [altmetrics](http://altmetrics.org)) on academic output (not just papers but also data and code) from a variety of sources.  This package provides a programmatic interface to the Total Impact API via R.


## Installing this package

```r
library(devtools)
install_github('rTotalImpact', 'rOpenSci')
```
## What is the current version of Total Impact's API?

```r
about_ti()
# you can get this as a cleaner output by setting as.df = TRUE
> about_ti(as.df = TRUE)
      Name                                                 Value
1  contact                              totalimpactdev@gmail.com
2    hello                                                 world
3  message Congratulations! You have found the total-Impact API.
4 moreinfo                       http://total-impact.tumblr.com/
5  version                                           jean-claude

It appears that we are currently on version jean-claude. Excellent.
```

## Which providers does TI derive its metrics from?

```r
ti_providers()
# this will return a list. If you prefer a data.frame, then set as.df = TRUE
ti_providers(as.df = TRUE)
> head(ti_providers(as.df = TRUE))
Total Impact currently provides metrics on the following data providers: 
bibtex citeulike crossref dataone delicious dryad facebook github mendeley plosalm pubmed slideshare topsy webpage wikipedia 
 ...
# you can also save this information to a .csv file if you'd like:
write.csv(ti_providers(as.df = TRUE), file = "~/Desktop/ti_providers.csv")
```

## I have a DOI, can I get some metrics on this paper?

```r
# First you need to get a Total Impact ID for any source you wish to track. 
my_id <- tiid('10.1890/ES11-00339.1')
# You can do the same for other namespaces, such as github usernames.
tiid('karthikram', 'github')
# Note that I explicitly specified the namespace since this isn't a doi.

# This function internally calls create_tiid() if a Total Impact ID was not previously assigned to this object. 
# This process is transparent to a user but lower level functions are available to call directly.

# Now we can proceed to getting metrics on this source (I've combined the two functions above).

metrics(tiid('10.1890/ES11-00339.1'))

```

## But I have a large list of DOIs, can I do this for all?

Sure thing!

```r
my_ids <- read.csv('~/Desktop/list_of_dois.csv')
tiids <- llply(as.list(my_ids$doi), tiid, .progress = 'text')
metrics <- llply(tiid, metrics, .progress = 'text')
```

## Looks great but seems a bit reptitive, right? If you have to repeatedly retrieve metrics on a collection of objects, then just make it into a collection!

```r
collection_id <- create_collection(tiids) # function not working yet
# Note that create_collection() needs a list as an input where each item on the list is itself a list with namespace and the id.

metrics <- collection_metics('kn5auf')
# You can save this to a csv:
save_collection('kn5auf', file = '~/Desktop/collection_metrics.csv')
```

## Neat, can I display these on the web?
Sure, we've included the code you need to paste into your webpage to make that happen.
just type in:
````r
collection_id$code (not functional yet)
# and there you have it!
```

# References and resources
* [full API Documentation](http://total-impact.org/api-docs).
* [What are altmetrics?](http://altmetrics.org/manifesto/)
