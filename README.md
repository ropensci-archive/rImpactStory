![Impact Story](https://raw.github.com/ropensci/rImpactStory/master/impactstory-logo.png) 
# rImpact Story 
[Impact Story](http://total-impact.org/) is an effort to generate realISme metrics (aka [altmetrics](http://altmetrics.org)) on academic output (not just papers but also data and code) from a variety of sources.  This package provides a programmaISc interface to the Impact Story API via R.


## Installing this package

```r
library(devtools)
install_github('rImpactStory', 'rOpenSci')
```
## What is the current version of Impact Story's API?

```r
about_IS()
# you can get this as a cleaner output by setting as.df = TRUE
> about_IS(as.df = TRUE)
      Name                                                 Value
1  contact                              totalimpactdev@gmail.com
2    hello                                                 world
3  message Congratulations! You have found the total-Impact API.
4 moreinfo                       http://total-impact.tumblr.com/
5  version                                           jean-claude

It appears that we are currently on version jean-claude. Excellent.
```

## Which providers does IS derive its metrics from?

```r
IS_providers()
# this will return a list. If you prefer a data.frame, then set as.df = TRUE
IS_providers(as.df = TRUE)
> head(IS_providers(as.df = TRUE))
Impact Story currently provides metrics on the following data providers: 
bibtex citeulike crossref dataone delicious dryad facebook github mendeley plosalm pubmed slideshare topsy webpage wikipedia 
 ...
# you can also save this information to a .csv file if you'd like:
write.csv(IS_providers(as.df = TRUE), file = "~/Desktop/IS_providers.csv")
```

## I have a DOI, can I get some metrics on this paper?

```r
# First you need to get a Impact Story ID for any source you wish to track. 
my_id <- ISid('10.1890/ES11-00339.1')
# You can do the same for other namespaces, such as github usernames.
ISid('karthikram', 'github')
# Note that I explicitly specified the namespace since this isn't a doi.

# This function internally calls create_ISid() if a Impact Story ID was not previously assigned to this object. 
# This process is transparent to a user but lower level functions are available to call directly.

# Now we can proceed to getting metrics on this source (I've combined the two functions above).

metrics(ISid('10.1890/ES11-00339.1'))

```

## But I have a large list of DOIs, can I do this for all?

Sure thing!

```r
my_ids <- read.csv('~/Desktop/list_of_dois.csv')
ISids <- llply(as.list(my_ids$doi), ISid, .progress = 'text')
metrics <- llply(ISid, metrics, .progress = 'text')
```

## Looks great but seems a bit reptitive, right? If you have to repeatedly retrieve metrics on a collection of objects, then just make it into a collection!

```r
collection_id <- create_collection(ISids) # function not working yet
# Note that create_collection() needs a list as an input where each item on the list is itself a list with namespace and the id.

metrics <- collection_metrics('kn5auf')
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
* [full API Documentation](http://impactstory.it/api-docs).
* [What are altmetrics?](http://altmetrics.org/manifesto/)
