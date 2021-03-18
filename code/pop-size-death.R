murders$state[which.max(murders$population)]   #which state has the highest population
which.max(murders$population) == which.max(murders$total)   #does that state have most gun deaths?

murders$state[which.min(murders$population)]   #which state has the lowest population
which.min(murders$population) == which.min(murders$total)   #does that state have least gun deaths?

murders %>%  #state gun murder totals 
  mutate(abb = reorder(abb, population)) %>%    #state abb ordered by population
  ggplot(aes(abb, total)) + 
  geom_histogram(stat = "identity", fill = "skyblue") + 
  ggtitle("State Gun Murder Totals") + 
  coord_flip() +
  ggsave("figs/barplot1.png")

murders %>%  #state gun murder totals 
  mutate(abb = reorder(abb, total)) %>%    #state abb ordered by gun deaths
  ggplot(aes(abb, total)) + 
  geom_histogram(stat = "identity", fill = "skyblue") + 
  ggtitle("State Gun Murder Totals") + 
  coord_flip() + 
  ggsave("figs/barplot2.png")


