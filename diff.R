load('data/new.data.RData')
library(plyr)

df.meth.aml = df.meth[,grepl('AML', colnames(df.meth))]
df.meth.nbm = df.meth[,grepl('NBM', colnames(df.meth))]

med.aml = unname(apply(X = df.meth.aml,MARGIN = 1,FUN = mean))
med.nbm = unname(apply(X = df.meth.nbm,MARGIN = 1,FUN = mean))

crit = log(med.aml/med.nbm)
crit2 = abs(med.aml - med.nbm)

max(crit2)
crit2 <- sort(crit2, decreasing = TRUE)
range(head(crit2,100))

#pheatmap(t(df.meth[which(crit >= 0.5),]))
#pheatmap(t(df.meth[which(crit <= -0.5),]))

df.meth.diff = df.meth[c(which(crit >= 0.6 | crit2 >= 0.25),which(crit <= -0.6 | crit2 >= 0.25)) ,]

library(pheatmap)
pheatmap(t(df.meth.diff), cluster_rows = FALSE)
pheatmap(t(df.meth.diff))
save(df.meth.diff, file = "df.meth2.diff.RData")

# test = df.meth.diff
# annotation <- data.frame(Var1 = factor(c(rep(1,42),rep(2,56)), labels = c('NBM', 'AML')))
# rownames(annotation) <- colnames(test) # check out the row names of annotation
# pheatmap(test, annotation = annotation)
# 
# annotation <- data.frame(Var1 = factor(1:10 %% 2 == 0, labels = c("Exp1", "Exp2")))
# rownames(annotation) <- colnames(test) # check out the row names of annotation
# pheatmap(test, annotation = annotation)
#df.ac = old
#df.ac = df.ac[,c(which(grepl('NBM', colnames(df.ac))), which(grepl('AML', colnames(df.ac))))]
#df.ac = df.ac/17.85223
#df.ac = scale(df.ac)
#df.ac = df.ac - range(df.ac)[1]
#df.ac = df.ac / (range(df.ac)[2]-range(df.ac)[1])

df.ac.aml = df.ac[,grepl('AML', colnames(df.ac))]
df.ac.nbm = df.ac[,grepl('NBM', colnames(df.ac))]

library(caroline)
med.aml.ac = unname(apply(X = df.ac.aml,MARGIN = 1,FUN = mean))
med.nbm.ac = unname(apply(X = df.ac.nbm,MARGIN = 1,FUN = mean))

#crit.ac = abs(med.nbm.ac - med.aml.ac)
crit.ac = log(med.nbm.ac / med.aml.ac)
crit2.ac = abs(med.nbm.ac - med.aml.ac)

# pheatmap(t(df.ac[which(crit.ac >= 0.3),]))
# pheatmap(t(df.ac[which(crit.ac <= -0.3),]))

#df.ac.diff = df.ac[which(crit.ac >= 3) ,]
df.ac.diff = df.ac[c(which(crit.ac >= 0.15),which(crit.ac <= -0.15)) ,]
library(pheatmap)
pheatmap(t(df.ac.diff), cluster_rows = FALSE)
save(df.ac.diff, file = "df.ac.diff.RData")

r.meth = rownames(df.meth.diff)
r.ac = rownames(df.ac.diff)

gr.meth

r.g.meth = gr.meth[which(rownames(df.meth) %in% r.meth)]
r.g.ac = gr.ac[which(rownames(df.ac) %in% r.ac)]

findOverlaps(r.g.meth, r.g.ac, maxgap = 1000)
test2 = findOverlaps(r.g.meth, r.g.ac, maxgap = 1000)

c.ac[test2@]


