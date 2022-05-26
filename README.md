# Big Five Analysis

This is a personal project done on open-source data to get my feet wet in tidying, analysing and visualising data with R.

## Tidying

The raw data was obtained from http://openpsychometrics.org/_rawdata/BIG5.zip (n = 19719). Each row contained a string comprising participants' responses to demographic questions (e.g. Age, Race, Gender) and the IPIP Big-Five Factor Markers (Goldberg, 1992). 

![](https://github.com/ho-han-sheng/BIG-5-Analysis/blob/master/images/Sample%20raw%20string.png)

This is obviously unreadable and some reformatting is required before any analysis can be done. 

My first tasks were then:
- To separate the individual responses in each string into their respective columns 
- To change all values of specific columns to be positively scaled. 

Some items (e.g. E2 I don't talk a lot.) are negatively scaled. That is on the five-point scale used (1=Disagree, 3=Neutral, 5=Agree), scoring a 5 would actually mean scoring lower on the extraversion trait. 

### tidyverse

Separating was simple and required a single but long separate() to split the string into distinguishable columns. 

Additionally, the dataset needed to be converted into a tibble to be (efficiently) used within tidyverse.

For converting the negatively scaled values, since all responses are based on a 5-point likert scale, we can subtract 6 from the value to obtain a negative value of what the response would be if it was positively scaled. We can then use the abs() function to return only the absolute value.

mutate(across()) is then used to apply this negative to positive function to every value inside every column which corresponds to a negatively scaled item. 

## Analysis

todo


## Visualisation

todo
