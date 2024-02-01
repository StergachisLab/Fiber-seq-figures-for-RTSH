library(dplyr)
library(readr)
library(ggplot2)

# average the RAW of each edge in each graph ------------------
df_raw <- read_tsv("conditional_codependency_graphs_PS00272_raw.tsv")
df_raw <- df_raw %>% filter(peak_omitted != "baseline")
df_raw$peak_omitted <- as.factor(df_raw$peak_omitted)

bar_raw <- ggplot(data=df_raw, aes(x=reorder(peak_omitted, -codep_ratio), y=codep_ratio, fill=peak_omitted)) +
  geom_bar(stat="identity") +
  theme_minimal() +
  theme(axis.line = element_line(color='black'),
        plot.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank()) +
  scale_fill_brewer(palette="Dark2") +
  xlab("Peak Omitted from Graph") +
  ylab("Codependency Ratio") +
  theme(legend.position="none")

ggsave("bar_conditional_codep_raw.png", bar_raw)
ggsave("bar_conditional_codep_raw.pdf", bar_raw)
