# Loading the data
setwd('/Users/exam/Downloads')
data <- read.csv('data.csv',sep = "\t")


# Cleaning the dataset
data <- subset(data, !( (data$VCL6==1 & data$VCL9==1 & data$VCL12==1) | (data$VCL6==1 & data$VCL9==1) | (data$VCL9==1 & data$VCL12==1) | (data$VCL6==1 & data$VCL12==1 )))

# Determining the level of depression.
questions <- data.frame(data$Q1A,data$Q2A,data$Q3A,data$Q4A,data$Q5A,data$Q6A,data$Q7A,data$Q8A,data$Q9A,data$Q10A,data$Q11A,data$Q12A,data$Q13A,data$Q14A,data$Q15A,data$Q16A,data$Q17A,data$Q18A,data$Q19A,data$Q20A,data$Q21A,data$Q22A,data$Q23A,data$Q24A,data$Q25A,data$Q26A,data$Q27A,data$Q28A,data$Q29A,data$Q30A,data$Q31A,data$Q32A,data$Q33A,data$Q34A,data$Q35A,data$Q36A,data$Q37A,data$Q38A,data$Q39A,data$Q40A,data$Q41A,data$Q42A)

questions$d1 = rowSums(questions[-1] == 1)
questions$d2 = rowSums(questions[-1] == 2)
questions$d3 = rowSums(questions[-1] == 3)
questions$d4 = rowSums(questions[-1] == 4)


questions$max <- colnames(questions)[apply(questions,1,which.max )]

questions$max <- ifelse(questions$max == "d1" , "1", 
                        ifelse(questions$max == "d2","2",
                               ifelse(questions$max == "d3" , "3","4")))

# Kmeans Clustering
cluster_result <- kmeans(questions,5)

table_result <- table(questions$max,cluster_result$cluster)

plot(data[c('Q1A','Q2A','Q3A','Q4A','Q5A','Q6A','Q7A','Q8A','Q9A','Q10A','Q11A','Q12A','Q13A','Q14A','Q15A','Q16A','Q17A','Q18A','Q19A','Q20A')],col=cluster_result$cluster)
