# Anxiety-DataScience

## DataSet

Dataset contains the set of questions that were asked through questionnaire during year 2017-2019.
This data was collected with a online version of the Depression Anxiety Stress Scale (DASS).

## File Structure 

1. [anxiety.R](https://github.com/VandanPatell/Anxiety-DataScience/blob/main/anxiety.R) - R Script
2. [data.csv](https://github.com/VandanPatell/Anxiety-DataScience/blob/main/data.csv) - CSV file that contains raw data
3. [codebook.txt](https://github.com/VandanPatell/Anxiety-DataScience/blob/main/codebook.txt) - Guide book to dataset

## Code Snippets

### Loading Data into R

```R
# set working directory to the location where dataset/project is located.
setwd('/Users/exam/Downloads')
# create dataframe data using read.csv() function 
data <- read.csv('data.csv',sep = "\t")
```

### 


### Questions in Survey

+ Q1	I found myself getting upset by quite trivial things.
+ Q2	I was aware of dryness of my mouth.
+ Q3	I couldn't seem to experience any positive feeling at all.
+ Q4	I experienced breathing difficulty (eg, excessively rapid breathing, breathlessness in the absence of physical exertion).
+ Q5	I just couldn&#39;t seem to get going.
+ Q6	I tended to over-react to situations.
+ Q7	I had a feeling of shakiness (eg, legs going to give way).
+ Q8	I found it difficult to relax.
+ Q9	I found myself in situations that made me so anxious I was most relieved when they ended.
+ Q10	I felt that I had nothing to look forward to.
+ Q11	I found myself getting upset rather easily.
+ Q12	I felt that I was using a lot of nervous energy.
+ Q13	I felt sad and depressed.
+ Q14	I found myself getting impatient when I was delayed in any way (eg, elevators, traffic lights, being kept waiting).
+ Q15	I had a feeling of faintness.
+ Q16	I felt that I had lost interest in just about everything.
+ Q17	I felt I wasn&#39;t worth much as a person.
+ Q18	I felt that I was rather touchy.
+ Q19	I perspired noticeably (eg, hands sweaty) in the absence of high temperatures or physical exertion.
+ Q20	I felt scared without any good reason.
+ Q21	I felt that life wasn&#39;t worthwhile.
+ Q22	I found it hard to wind down.
+ Q23	I had difficulty in swallowing.
+ Q24	I couldn&#39;t seem to get any enjoyment out of the things I did.
+ Q25	I was aware of the action of my heart in the absence of physical exertion (eg, sense of heart rate increase, heart missing a beat).
+ Q26	I felt down-hearted and blue.
+ Q27	I found that I was very irritable.
+ Q28	I felt I was close to panic.
+ Q29	I found it hard to calm down after something upset me.
+ Q30	I feared that I would be &quot;thrown&quot; by some trivial but unfamiliar task.
+ Q31	I was unable to become enthusiastic about anything.
+ Q32	I found it difficult to tolerate interruptions to what I was doing.
+ Q33	I was in a state of nervous tension.
+ Q34	I felt I was pretty worthless.
+ Q35	I was intolerant of anything that kept me from getting on with what I was doing.
+ Q36	I felt terrified.
+ Q37	I could see nothing in the future to be hopeful about.
+ Q38	I felt that life was meaningless.
+ Q39	I found myself getting agitated.
+ Q40	I was worried about situations in which I might panic and make a fool of myself.
+ Q41	I experienced trembling (eg, in the hands).
+ Q42	I found it difficult to work up the initiative to do things.

Based on the questions users were propmted to choose from the below given options whichever was applicable to him/her.

+ 1  Did not apply to me at all 
 	- Does not apply 
+ 2  Applied to me to some degree, or some of the time
	- Applies at some extent
+ 3 Applied to me to a considerable degree, or a good part of the time
 	- Applies at most of time
+ 4 Applied to me very much, or most of the time
	- Applies very much

based on the choosen options depression level of the users was determined into four scales.

+ Level - 1 (Less or not depressed)
+ Level - 2 (Moderately depressed)
+ Level - 3 (Depressed at some extent)
+ Level - 4 (Highly Depressed)

```R
# Load the answers to new dataframe named questions.
questions <- data.frame(data$Q1A,data$Q2A,data$Q3A,data$Q4A,data$Q5A,data$Q6A,data$Q7A,data$Q8A,data$Q9A,data$Q10A,data$Q11A,data$Q12A,data$Q13A,data$Q14A,data$Q15A,data$Q16A,data$Q17A,data$Q18A,data$Q19A,data$Q20A,data$Q21A,data$Q22A,data$Q23A,data$Q24A,data$Q25A,data$Q26A,data$Q27A,data$Q28A,data$Q29A,data$Q30A,data$Q31A,data$Q32A,data$Q33A,data$Q34A,data$Q35A,data$Q36A,data$Q37A,data$Q38A,data$Q39A,data$Q40A,data$Q41A,data$Q42A)

# Get the count of occurences of the level in rows excluding the index column from data
questions$d1 = rowSums(questions[-1] == 1)
questions$d2 = rowSums(questions[-1] == 2)
questions$d3 = rowSums(questions[-1] == 3)
questions$d4 = rowSums(questions[-1] == 4)

# Get the column name with max no of level count from the row
questions$max <- colnames(questions)[apply(questions,1,which.max )]

# Rewrite the levels based on the column names and predict the level of depression.
questions$max <- ifelse(questions$max == "d1" , "1", 
                        ifelse(questions$max == "d2","2",
                               ifelse(questions$max == "d3" , "3","4")))

```
