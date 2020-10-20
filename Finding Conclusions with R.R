library(ggplot2)
df = read.csv("C:\\Users\\sean1\\Documents\\2Y\\WSA\\Xtern Data Science\\wrangled.csv")
# according to wikipedia, Mason-Dixon line is 39 deg 43'19.92216" N, aka
m.d.decimal = 39.72220060
northern.ratings = df[df$Latitude > m.d.decimal, 'Rating']
southern.ratings = df[df$Latitude < m.d.decimal, 'Rating']
length(northern.ratings)
length(southern.ratings)

# compare the two with an independent samples t test, first are they different?
# H0: north - south == 0
# H1: north - south =/= 0
t.test(x = northern.ratings, y = southern.ratings,
       conf.level = 0.95,
       alternative = "two.sided")
# Seems as though the southern ratings are better, but not by a lot.
# Maybe a more specific test?

# H0: south - north <= 0
# H1: south - north > 0
t.test(x = southern.ratings, y = northern.ratings,
       conf.level = 0.95,
       alternative = "greater")
par(mfrow=c(1,2))
hist(southern.ratings)
abline(v=mean(southern.ratings, na.rm = TRUE), col='blue')
hist(northern.ratings)
abline(v=mean(northern.ratings, na.rm=TRUE), col='blue')
