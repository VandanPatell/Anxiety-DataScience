setwd('/Users/exam/Downloads')
data <- read.csv('data.csv',sep = "\t")


# Cleaning part 
#unique(data$education)
# Filter out the literate and illeterate people
data$literacy <- ifelse( data$education == 0, "Illiterate", "Literate" )
data$education.fix <- ifelse( data$education == 1 , "Less than High School",
                              ifelse( data$education == 2 ,"High School",
                                      ifelse( data$education == 3 , "University degree",
                                              ifelse( data$education == 4 , "Graduate",NA))))

#summary(as.factor(data$education.fix))
data$urban.fix <- ifelse( data$urban == 1 , "Rural",
                          ifelse( data$urban == 2, "Suburban",
                                  ifelse( data$urban == 3, "Urban",NA)))

unique(data$gender)

# Filter out the genders of the candiates.
data$gender.fix <- ifelse( data$gender == 1 ,"Male",
                           ifelse( data$gender == 2, "Female",
                                   ifelse( data$gender == 3 , "Other", NA)))
#summary(as.factor(data$gender.fix))

unique(data$engnat)

data$engnat.fix <- ifelse(data$engnat == 1 , "Yes",
                          ifelse(data$engnat == 2, "No",NA))

#summary(as.factor(data$engnat.fix))

unique(data$age)
summary(data$age)

unique(data$hand)

data$hand.fix <- ifelse(data$hand == 1 ,"Right",
                        ifelse(data$hand == 2, "Left", 
                               ifelse(data$hand == 3,"Both",NA)))

unique(data$engnat)
unique(data$married)
coefficients(data$married)

questions <- data.frame(data$Q1A,data$Q2A,data$Q3A,data$Q4A,data$Q5A,data$Q6A,data$Q7A,data$Q8A,data$Q9A,data$Q10A,data$Q11A,data$Q12A,data$Q13A,data$Q14A,data$Q15A,data$Q16A,data$Q17A,data$Q18A,data$Q19A,data$Q20A,data$Q21A,data$Q22A,data$Q23A,data$Q24A,data$Q25A,data$Q26A,data$Q27A,data$Q28A,data$Q29A,data$Q30A,data$Q31A,data$Q32A,data$Q33A,data$Q34A,data$Q35A,data$Q36A,data$Q37A,data$Q38A,data$Q39A,data$Q40A,data$Q41A,data$Q42A)

questions$d1 = rowSums(questions[-1] == 1)
questions$d2 = rowSums(questions[-1] == 2)
questions$d3 = rowSums(questions[-1] == 3)
questions$d4 = rowSums(questions[-1] == 4)

questions$max <- max(questions$d1,questions$d2,questions$d3,questions$d4)

#Drop max column
questions <- subset(questions ,select =  -c(max))

questions$max <- colnames(questions)[apply(questions,1,which.max )]

questions$max <- ifelse(questions$max == "d1" , "1", 
                        ifelse(questions$max == "d2","2",
                               ifelse(questions$max == "d3" , "3","4")))

data$depression.lvl <- questions$max

data$major <- ifelse( data$major == "" , "Never opt for major", data$major)

library(ggplot2)

ggplot(data , aes(x = depression.lvl,y=age)) + geom_line()

#--------------------------------------------------------------------------------------
data$TIPI1 <- ifelse(data$TIPI1 == 1 , "Disagree strongly", ifelse(data$TIPI1 == 2 ,'Disagree moderately',ifelse(data$TIPI1 == 3 ,'Disagree a little',ifelse(data$TIPI1 == 4 ,'Neither agree nor disagree',ifelse(data$TIPI1 == 5 ,'Agree a little',ifelse(data$TIPI1 == 6 ,'Agree moderately','Agree strongly'))))))

data$TIPI2 <- ifelse(data$TIPI2 == 1 , "Disagree strongly", ifelse(data$TIPI2 == 2 ,'Disagree moderately',ifelse(data$TIPI2 == 3 ,'Disagree a little',ifelse(data$TIPI2 == 4 ,'Neither agree nor disagree',ifelse(data$TIPI2 == 5 ,'Agree a little',ifelse(data$TIPI2 == 6 ,'Agree moderately','Agree strongly'))))))

data$TIPI3 <- ifelse(data$TIPI3 == 1 , "Disagree strongly", ifelse(data$TIPI3 == 2 ,'Disagree moderately',ifelse(data$TIPI3 == 3 ,'Disagree a little',ifelse(data$TIPI3 == 4 ,'Neither agree nor disagree',ifelse(data$TIPI3 == 5 ,'Agree a little',ifelse(data$TIPI3 == 6 ,'Agree moderately','Agree strongly'))))))

data$TIPI4 <- ifelse(data$TIPI4 == 1 , "Disagree strongly", ifelse(data$TIPI4 == 2 ,'Disagree moderately',ifelse(data$TIPI4 == 3 ,'Disagree a little',ifelse(data$TIPI4 == 4 ,'Neither agree nor disagree',ifelse(data$TIPI4 == 5 ,'Agree a little',ifelse(data$TIPI4 == 6 ,'Agree moderately','Agree strongly'))))))

data$TIPI5 <- ifelse(data$TIPI5 == 1 , "Disagree strongly", ifelse(data$TIPI5 == 2 ,'Disagree moderately',ifelse(data$TIPI5 == 3 ,'Disagree a little',ifelse(data$TIPI5 == 4 ,'Neither agree nor disagree',ifelse(data$TIPI5 == 5 ,'Agree a little',ifelse(data$TIPI5 == 6 ,'Agree moderately','Agree strongly'))))))

data$TIPI6 <- ifelse(data$TIPI6 == 1 , "Disagree strongly", ifelse(data$TIPI6 == 2 ,'Disagree moderately',ifelse(data$TIPI6 == 3 ,'Disagree a little',ifelse(data$TIPI6 == 4 ,'Neither agree nor disagree',ifelse(data$TIPI6 == 5 ,'Agree a little',ifelse(data$TIPI6 == 6 ,'Agree moderately','Agree strongly'))))))

data$TIPI7 <- ifelse(data$TIPI7 == 1 , "Disagree strongly", ifelse(data$TIPI7 == 2 ,'Disagree moderately',ifelse(data$TIPI7 == 3 ,'Disagree a little',ifelse(data$TIPI7 == 4 ,'Neither agree nor disagree',ifelse(data$TIPI7 == 5 ,'Agree a little',ifelse(data$TIPI7 == 6 ,'Agree moderately','Agree strongly'))))))

data$TIPI8 <- ifelse(data$TIPI8 == 1 , "Disagree strongly", ifelse(data$TIPI8 == 2 ,'Disagree moderately',ifelse(data$TIPI8 == 3 ,'Disagree a little',ifelse(data$TIPI8 == 4 ,'Neither agree nor disagree',ifelse(data$TIPI8 == 5 ,'Agree a little',ifelse(data$TIPI8 == 6 ,'Agree moderately','Agree strongly'))))))

data$TIPI9 <- ifelse(data$TIPI9 == 1 , "Disagree strongly", ifelse(data$TIPI9 == 2 ,'Disagree moderately',ifelse(data$TIPI9 == 3 ,'Disagree a little',ifelse(data$TIPI9 == 4 ,'Neither agree nor disagree',ifelse(data$TIPI9 == 5 ,'Agree a little',ifelse(data$TIPI9 == 6 ,'Agree moderately','Agree strongly'))))))

data$TIPI10 <- ifelse(data$TIPI10 == 1 , "Disagree strongly", ifelse(data$TIPI10 == 2 ,'Disagree moderately',ifelse(data$TIPI10 == 3 ,'Disagree a little',ifelse(data$TIPI10 == 4 ,'Neither agree nor disagree',ifelse(data$TIPI10 == 5 ,'Agree a little',ifelse(data$TIPI10 == 6 ,'Agree moderately','Agree strongly'))))))


TIPI <- data.frame(data$TIPI1,data$TIPI2,data$TIPI3,data$TIPI4,data$TIPI5,data$TIPI6,data$TIPI7,data$TIPI8,data$TIPI9,data$TIPI10)

colnames(TIPI) <- c("Extraverted","Critical","Dependable","Anxious","complex","Reserved","Sympathetic","Disorganized","Calm","Conventional")

library(rpart)

model <- rpart(
  "Extraverted ~ Critical + Dependable + Anxious + Calm + Conventional",
  data = TIPI,
  method = "class"
  
)

library(rpart.plot)
rpart.plot(model)
