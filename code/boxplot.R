head(murders)

murders %>%  #generating boxplots
  group_by(region) %>% 
  ggplot(aes(region, rate, fill = region)) + 
  geom_hline(yintercept = ave_deaths, color = "red") +
  geom_boxplot() + 
  geom_point() + 
  ggtitle("Boxplot Regions Gun Murders") +
  ggsave("figs/boxplot1.png")

murders %>%  #boxplot again without DC 
  filter(!state == "District of Columbia") %>% 
  group_by(region) %>% 
  ggplot(aes(region, rate, fill = region)) + 
  geom_boxplot() + 
  geom_point() + 
  ggtitle("Boxplot Regions Gun Murders w/o DC") + 
  geom_hline(yintercept = ave_deaths, color = "red") +
  ggsave("figs/boxplot2.png")

murders %>% filter(state == "District of Columbia") #confirm DC region listed as "South"

murders %>%  #generating new boxplot with label
  group_by(region) %>% 
  ggplot(aes(region, rate, fill = region)) + 
  geom_boxplot() + 
  geom_point() + 
  annotate("text", x = "South", y = 1.7, label = "DC") + 
  ggtitle("Boxplot Regions Gun Murders with Label") + 
  geom_hline(yintercept = ave_deaths, color = "red") +
  ggsave("figs/boxplot3.png")

#note to self: need to learn how to automatically assign labels to only a few datapoints. 