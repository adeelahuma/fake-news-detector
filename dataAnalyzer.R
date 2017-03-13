library(tm)
library(NLP)

setwd("/Users/adeelahuma/Documents/Grad School/Data Analytics 2/panda")

fake_news_dir_path <-"/Users/adeelahuma/Documents/Grad School/Data Analytics 2/data/fake_news"

fake_news_dir <- DirSource(fake_news_dir_path)
docs_fn <- Corpus(fake_news_dir, readerControl = list(reader=readPlain))


options(stringsAsFactors = FALSE)

cleanCorpus <- function(corpus){
  
  corpus.tmp <- tm_map(corpus, removePunctuation)
  corpus.tmp <- tm_map(corpus.tmp, stripWhitespace)
  corpus.tmp <- tm_map(corpus.tmp, tolower)
  corpus.tmp <- tm_map(corpus.tmp, removeWords, stopWords("english"))
  corpus.tmp <- tm_map(corpus.tmp, PlainTextDocument)
  
  return (corpus.tmp)
  
}

# build TDM (Term Document Matrix)

tdm <- lapply(generateTDM, path = fake_news_dir_path, dType='fake')
s.cor <- Corpus(DirSource(directory = fake_news_dir_path))#, encoding ="Windows-1254"))
s.cor.cl <- cleanCorpus(s.cor)
s.dtm <- DocumentTermMatrix(s.cor.cl)

#print('term document')
s.tdm <- TermDocumentMatrix(s.cor.cl)
#print(s.tdm)
#s.dtms <- removeSparseTerms(s.dtm, 0.7)
