
counts=matrix(0,nrow=16,ncol=4)
for (j in 1:4) {
  for(i in 1:16){
    counts[i,j]=length(which(Learning[,j]==(i-1)))
  }
}
rownames(counts)=0:15
colnames(counts)=c("Visual","Aural","Read_Write","Kinesthetic")
write.csv(counts,"counts.csv")

####################################################################################
aggregate=colSums(Learning)
write.csv(aggregate,"aggregate.csv")

####################################################################################

Diversity=rowSums(Learning)
sortDi=sort(Diversity)
write.csv(sortDi, "sortDi.csv")

####################################################################################

type=matrix(0,nrow=31,ncol=1)
for(i in 1:31){
  type[i,]=which(Learning[i,]==max(Learning[i,]))[sample(which(Learning[i,]==max(Learning[i,])),1)]
}

frac=as.numeric((table(type)/sum(table(type)))*100)
write.csv(frac,"frac.csv")

######################################################################################

Sum=matrix(0,ncol=2,nrow=6)
Sum[1,1]="Friends or Family"
Sum[1,2]=length(grep("friends|family",Personal))
Sum[2,1]="Projects"
Sum[2,2]=length(grep("projects|research",Personal))
Sum[3,1]="Jobs or Internships"
Sum[3,2]=length(grep("job|internship|work",Personal))
Sum[4,1]="Classes or Courses"
Sum[4,2]=length(grep("class|course",Personal))
Sum[5,1]="Interests or Curiosity"
Sum[5,2]=length(grep("interest|curiosity|fun",Personal))
Sum[6,1]="Other"
Sum[6,2]=3
write.csv(Sum, "perexp.csv")