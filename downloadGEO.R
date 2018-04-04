library(Biobase)
library(GEOquery)

geo.meth <- getGEO("GSE29047", GSEMatrix =TRUE, getGPL=FALSE)
geo.ac <- getGEO("GSE27863", GSEMatrix =TRUE, getGPL=FALSE)

geo.meth = geo.meth$GSE29047_series_matrix.txt.gz
geo.ac = geo.ac$GSE27863_series_matrix.txt.gz

save(geo.ac, geo.meth, file = 'GEO.data.RData')
