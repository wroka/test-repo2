
statesInfo <- read.csv('stateData.csv')

subset(statesInfo, state.region == 1)

statesInfo[statesInfo$state.region == 1, ]

subset(statesInfo, statesInfo$illiteracy == 0.5) # subset of illiteracy at 1/2 a percent

statesInfo[statesInfo$highSchoolGrad >= 50.0, ] # high school grad rate above 50%; subset

reddit <- read.csv('reddit.csv')

str(reddit)

table(reddit$employment.status) # how many are in each group of employment status?

summary(reddit)

levels(reddit$age.range)

qplot(data = reddit, x = age.range)

install.packages("KernSmooth")
install.packages("devtools")
find_rtools()
