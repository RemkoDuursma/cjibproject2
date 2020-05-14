


# Een ander model
library(mgcv)

data <- subset(park_gr, label == "P7")

with(data, plot(week_time, parked, pch="."))

model2 <- gam(parked ~ s(week_time, k=50), data = data)

visreg(model2)

# Voorspelling: nu
wt <- (wday(Sys.time()) - 1) * 24*60 +
  60*(hour(Sys.time())) + minute(Sys.time())

predict(model2, newdata = data.frame(week_time = wt))
points(wt, 9, pch=19,col="red")


