pkgname <- "dodoR"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('dodoR')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("ch")
### * ch

flush(stderr()); flush(stdout())

### Name: ch
### Title: Enem 2012 Humanity Sciences Test
### Aliases: ch
### Keywords: datasets

### ** Examples

data(ch)



cleanEx()
nameEx("ch_keys")
### * ch_keys

flush(stderr()); flush(stdout())

### Name: ch_keys
### Title: Enem 2012 Humanities Sciences Keys
### Aliases: ch_keys
### Keywords: datasets

### ** Examples

data(ch_keys)



cleanEx()
nameEx("cn")
### * cn

flush(stderr()); flush(stdout())

### Name: cn
### Title: Enem 2012 Natural Sciences Test
### Aliases: cn
### Keywords: datasets

### ** Examples

data(cn)



cleanEx()
nameEx("cn_keys")
### * cn_keys

flush(stderr()); flush(stdout())

### Name: cn_keys
### Title: Enem 2012 Natural Sciences Keys
### Aliases: cn_keys
### Keywords: datasets

### ** Examples

data(cn_keys)



cleanEx()
nameEx("lce")
### * lce

flush(stderr()); flush(stdout())

### Name: lce
### Title: Enem 2012 Languages and Codes - Spanish Test
### Aliases: lce
### Keywords: datasets

### ** Examples

data(lce)



cleanEx()
nameEx("lce_keys")
### * lce_keys

flush(stderr()); flush(stdout())

### Name: lce_keys
### Title: Enem 2012 Languages and Codes - Spanish Keys
### Aliases: lce_keys
### Keywords: datasets

### ** Examples

data(lce_keys)



cleanEx()
nameEx("lci")
### * lci

flush(stderr()); flush(stdout())

### Name: lci
### Title: Enem 2012 Languages and Codes - English Test
### Aliases: lci
### Keywords: datasets

### ** Examples

data(lci)



cleanEx()
nameEx("lci_keys")
### * lci_keys

flush(stderr()); flush(stdout())

### Name: lci_keys
### Title: Enem 2012 Languages and Codes - English Keys
### Aliases: lci_keys
### Keywords: datasets

### ** Examples

data(lci_keys)



cleanEx()
nameEx("mt")
### * mt

flush(stderr()); flush(stdout())

### Name: mt
### Title: Enem 2012 Mathematics Test
### Aliases: mt
### Keywords: datasets

### ** Examples

data(mt)



cleanEx()
nameEx("mt_keys")
### * mt_keys

flush(stderr()); flush(stdout())

### Name: mt_keys
### Title: Enem 2012 Languages and Codes - Mathematics Keys
### Aliases: mt_keys
### Keywords: datasets

### ** Examples

data(mt_keys)



cleanEx()
nameEx("sample.rows")
### * sample.rows

flush(stderr()); flush(stdout())

### Name: sample.rows
### Title: Random Samples of Rows
### Aliases: sample.rows
### Keywords: rows sample

### ** Examples

##Sample 5 random rows form the cars dataset
sample.rows(x = cars, size = 5)



### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
