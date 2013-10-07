# Loaded the Learning File into R
Learning=readLines("Learning.txt")

#Find ALl Lines With Numbers
LEA = as.numeric(gsub("[^0-9]*", "", Learning))

#Remove NA's
LEA= as.numeric(LEA[!is.na(LEA)])

#Created vectors with length 30
Learninglast = (length(LEA)-4)/4

#Created Visual, Aural, Read_Write, and Kinesthetic vectors with length of Learninglast
Visual = LEA[c(1,1+4*(1:Learninglast))]
Aural = LEA[c(2,2+4*(1:Learninglast))]
Read_Write = LEA[c(3,3+4*(1:Learninglast))]
Kinesthetic = LEA[c(4,4+4*(1:Learninglast))]

#Created dataframe of Visual, Aural, Read_Write, and Kinesthetic vectors:
Skills=data.frame(Visual,Aural,Read_Write,Kinesthetic)

# Sum the columns to determine aggregate skill levels (sample test of 31 respondents)
aggregate=colSums(Skills)

write.csv(aggregate,"aggregate.csv")

#Nice little bar plot of the results
barplot(aggregate,col=c("blue","red","green","purple"),main="Agggregate Skill Sample Size 31",ylim=c(0,250))
DIstribution of learning styles

#How Diverse is our class? We examine the marginal distribution of numerical answers by taking the sum of the row

Diversity=rowSums(Skills)
sortDi=sort(Diversity)
#Nice Plot where I sorted the rowsums and graphed it to see how spread the aggregate numerical answers were at the margin.
write.csv(sortDi, "sortDi.csv")

plot(sort(sortDi),col="red",main="Specialists vs. Generalists",type="b",pch=18,ylab="Aggregate Numerical Answers",xlab="Students")
#Conclusion: Equipped for diverse learning environments. While aggregate skills say class is unified, the marginal brakdown suggests this is due to the class coming together. Marginally things look very dispersed, but people can compliment each other and help each other grow and learn.

#Loaded the Preferences File into R
Preferences=readLines("personal.txt")
Preferences

#Determine how many people learned from classes/course material rather tahn professional or personal environments
Class=grep("[Cc]lass",Preferences)
Course=grep("[Cc]ourse+",Preferences)
Nerds=length(Class)+length(Course)

#Determine how many people learned from internships and professional experiences
Internship=grep("[Ii]nternship+",Preferences)
Work=grep("[Ww]ork",Preferences)
Job=grep("[Jj]ob",Preferences)
MoMoney=length(Internship) +length(Work)+length(Job)

#Adjusted for repeats to determine how many people learn the material socially and for fun. The subtraction is for an adjustment
Personal_Projects=grep("[Pp]ersonal",Preferences)
Friends=grep("[Ff]riend+",Preferences)
SuperNerds=length(Friends)+length(Personal_Projects)-4

# Let's make it a plot!

#First, we aggregate the three sums into a vector of length 3
collection=c(Nerds,MoMoney,SuperNerds)

#Make a pie chart!
lbls=c("Class (10)","Work (14)","Social (21)")

pie(collection,col=c("blue","gold","turquoise"),labels=lbls,main="Sources of learning")
# Conclusion: The majority of the class has a lot of experience learning the material through personal projects. This may be attributable to thee computational aspects of the course as traditionally, programming is learned from experience outside of the classroom. I haven't accounted for overlap, but I don't think overlap matters in this case.
