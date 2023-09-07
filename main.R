suppressPackageStartupMessages({
  library(tercen)
  library(dplyr)
  library(fgsea)
})

ctx <- tercenCtx()

min_size <- ctx$op.value('min_size', as.double, 10)
max_size <- ctx$op.value('max_size', as.double, 500)
seed <- ctx$op.value('seed', as.double, 42)
if(seed > 0) set.seed(seed)
  
df <- ctx %>% select(.ri, .ci, .y)

df_to_list <- df[, c(".ri", ".ci")]
set_list <- base::split(df_to_list, list(df_to_list$.ri))
set_list <- lapply(set_list, function(x) { x[".ri"] <- NULL; as.character((x[[".ci"]])) })

df_to_rank <- ctx %>% select(.ci, .y) %>%
  group_by(.ci) %>%
  summarise(.y = mean(.y, na.rm = TRUE))

rank_list <- df_to_rank[[".y"]]
names(rank_list) <- as.character(df_to_rank[[".ci"]])

df_fgsea <- fgsea(
  pathways = set_list, 
  stats    = rank_list,
  minSize  = min_size,
  maxSize  = max_size
)

df_fgsea %>%
  select(pathway, pval, padj, ES, NES) %>%
  mutate(.ri = as.integer(as.numeric(pathway))) %>% 
  select(-pathway) %>%
  ctx$addNamespace() %>%
  ctx$save()
