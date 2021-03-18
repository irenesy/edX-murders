head(murders)

#with DC
murders %>% 
  ggplot() + 
  geom_density(aes(total)) + 
  ggtitle("Total Density Plot") + 
  ggsave("figs/density1.png")
murders %>% 
  ggplot(aes(sample = total)) + 
  geom_qq() + 
  geom_qq_line() + 
  ggtitle("Total QQ-plot") + 
  ggsave("figs/total1.png")

murders %>% 
  ggplot() + 
  geom_density(aes(rate)) + 
  ggtitle("Rate Density Plot") + 
  ggsave("figs/density2.png")
murders %>% 
  ggplot(aes(sample = rate)) + 
  geom_qq() + 
  geom_qq_line() + 
  ggtitle("Rate QQ-plot") + 
  ggsave("figs/total2.png")

#Without DC
head(murders)
states_only <- murders %>% 
  filter(!state == "District of Columbia")
states_only %>% 
  ggplot(aes(sample = rate)) + 
  geom_qq() + 
  geom_qq_line() + 
  ggtitle("States Only Rate QQ-plot")
