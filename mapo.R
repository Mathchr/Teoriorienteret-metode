library(pdftools)
library(tm)
library(SnowballC)

files <- list.files(pattern = "pdf$")

opinions <- lapply(files, pdf_text)

corp <- Corpus(URISource(files),
               readerControl = list(reader = readPDF))

opinions.tdm <- TermDocumentMatrix(corp, 
                                   control = 
                                     list(stopwords = TRUE,
                                          tolower = TRUE,
                                          stemming = TRUE,
                                          removeNumbers = TRUE,
                                          bounds = list(global = c(1, Inf)))) 

ft <- findFreqTerms(opinions.tdm, lowfreq = 10, highfreq = Inf)
as.matrix(opinions.tdm[ft,]) 

ft.tdm <- as.matrix(opinions.tdm[ft,])
sort(apply(ft.tdm, 1, sum), decreasing = TRUE)
