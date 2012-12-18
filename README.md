![ImpactStory](https://raw.github.com/ropensci/rImpactStory/master/impactstory-logo.png)
# rImpactStory
[ImpactStory](http://total-impact.org/) is an effort to generate realtime metrics (aka [altmetrics](http://altmetrics.org)) on academic output (not just papers but also data and code) from a variety of sources.  This package provides a programmatic interface to the ImpactStory API via R.


## Installing this package
A stable version of this package is now available on CRAN. But if you prefer to install a dev version, follow the instructions below:

```r
library(devtools)
install_github('rImpactStory', 'rOpenSci')
```
# API keys
As of V1, ImpactStory now requires API keys. To request one, send an email to [team@impactstory.org](mailto:team@impactstory.org). The key allows one to register up to 1000 items for free. For use with this package, one should store the key in their `.rprofile` as follows:

`options(ImpactStoryKey = 'YOUR_KEY')`

or supply it as a function argument with each call (in situations where storing in the `.rprofile` is not ideal.)

## What is the current version of ImpactStory's API?

```r
about_IS()
# you can get this as a cleaner output by setting as.df = TRUE
> about_IS(as.df = TRUE)
     Name                                                 Value
1  contact                              totalimpactdev@gmail.com
2    hello                                                 world
3  message Congratulations! You have found the total-Impact API.
4 moreinfo                       http://total-impact.tumblr.com/
5  version                                             cristhian

It appears that we are currently on version cristhian. Excellent.
```

## Which providers does IS derive its metrics from?

```r
IS_providers()
# this will return a list. If you prefer a data.frame, then set as.df = TRUE
IS_providers(as.df = TRUE)
> head(IS_providers(as.df = TRUE))
ImpactStory currently provides metrics on the following data providers:
bibtex citeulike crossref dataone delicious dryad facebook github mendeley plosalm pubmed slideshare topsy webpage wikipedia
 ...
# you can also save this information to a .csv file if you'd like:
write.csv(IS_providers(as.df = TRUE), file = "~/Desktop/IS_providers.csv")
```

## I have a DOI, can I get some metrics on this paper?

```r
my_id <- metrics('10.1890/ES11-00339.1')
# That simple! ImpactStory no longer generates their own unique ID. Just be sure to explicitly specifiy namespace if you are supplying something other than a DOI
```

## But I have a large list of DOIs, can I do this for all?

Sure thing!

```r
my_ids <- read.csv('~/Desktop/list_of_dois.csv')
metrics <- llply(as.list(my_ids$doi), metrics, .progress = 'text')
```

## Looks great but seems a bit reptitive, right? If you have to repeatedly retrieve metrics on a collection of objects, then just make it into a collection!

```r
collection_id <- create_collection(ISids) # function not working yet
# Note that create_collection() needs a list as an input where each item on the list is itself a list with namespace and the id.

metrics <- collection_metrics('kn5auf')
# You can save this to a csv:
save_collection('kn5auf', file = '~/Desktop/collection_metrics.csv')
```


# References and resources
* [full API Documentation](http://impactstory.it/api-docs).
* [What are altmetrics?](http://altmetrics.org/manifesto/)
