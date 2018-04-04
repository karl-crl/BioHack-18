load('data/df.meth.diff.RData')
nbm = df.meth.diff[,grepl('NBM', colnames(df.meth.diff))]
aml = df.meth.diff[,grepl('AML', colnames(df.meth.diff))]

hm = pheatmap(t(df.meth.diff))

gemeorder = hm$tree_col$labels[hm$tree_col$order]
nbm = nbm[gemeorder,]
aml = aml[gemeorder,]

library(pheatmap)
hmn = pheatmap(t(nbm), cluster_rows = TRUE, cluster_cols = FALSE)
hma = pheatmap(t(aml), cluster_rows = TRUE, cluster_cols = FALSE)

nbmorder = hmn$tree_row$labels[hmn$tree_row$order]
amlorder = hma$tree_row$labels[hma$tree_row$order]
df.meth.diff = df.meth.diff[,c(nbmorder, rev(amlorder))]


pheatmap(t(df.meth.diff), cluster_rows = FALSE)

load('data/df.ac.diff.RData')
nbm.ac = df.ac.diff[,grepl('NBM', colnames(df.ac.diff))]
aml.ac = df.ac.diff[,grepl('AML', colnames(df.ac.diff))]

hm.ac = pheatmap(t(df.ac.diff), cluster_rows = FALSE)

gemeorder.ac = hm.ac$tree_col$labels[hm.ac$tree_col$order]
nbm.ac = nbm.ac[gemeorder.ac,]
aml = aml.ac[gemeorder.ac,]

library(pheatmap)
hmn.ac = pheatmap(t(nbm.ac), cluster_rows = TRUE, cluster_cols = FALSE)
hma.ac = pheatmap(t(aml.ac), cluster_rows = TRUE, cluster_cols = FALSE)

nbmorder.ac = hmn.ac$tree_row$labels[hmn.ac$tree_row$order]
amlorder.ac = hma.ac$tree_row$labels[hma.ac$tree_row$order]
df.ac.diff = df.ac.diff[,c(nbmorder.ac, rev(amlorder.ac))]


pheatmap(t(df.ac.diff), cluster_rows = FALSE)
