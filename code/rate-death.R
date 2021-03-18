murders <- murders %>% mutate(rate = total/population*10000)   #add rate column
head(murders)

ave_deaths <- mean(murders$rate) 

murders %>%    #bargraph states in order of gun murder death rates with national average
  mutate(abb = reorder(abb, rate)) %>% 
  ggplot(aes(abb, rate)) + 
  geom_histogram(stat = "identity", fill = "skyblue") + 
  ggtitle("State Gun Murder Rates") +
  coord_flip() +
  geom_hline(yintercept = ave_deaths, linetype = "dashed", color = "red", size = 1.5)

murders %>% 
  filter(rate >= ave_deaths) %>% 
  mutate(rank = rank(-rate)) %>% select(rank, state) %>% arrange(rank)

