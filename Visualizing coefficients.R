library(jtools)


#Read in data
Sample <- haven::read_sav("Sample.sav")

names(Sample)

cor(Sample$D_ISSsum,Sample$D_OSSsum)

psych::describe(Sample$D_ISSsum)

psych::describe(Sample$D_OSSsum)

TocaCon<-lm(tocaconcentT4m~TeacherID + tocaconcentT1m + D_ISSsum + D_OSSsum + 
              D_MealStatusnew + 
              D_Ethnicitynew + D_Gender, data=Sample)

TocaDis<-lm(tocadisruptT4m~TeacherID + tocadisruptT1m + D_ISSsum + D_OSSsum+ 
              D_MealStatusnew + 
              D_Ethnicitynew + D_Gender, data=Sample)

TocaPro<-lm(tocaprosocT4m~TeacherID + tocaprosocT1m + D_ISSsum + D_OSSsum+ 
              D_MealStatusnew + 
              D_Ethnicitynew + D_Gender, data=Sample)

TocaInt<-lm(tocainternalT4m~TeacherID + tocainternalT1m + D_ISSsum + D_OSSsum+ 
              D_MealStatusnew + 
              D_Ethnicitynew + D_Gender, data=Sample)

plot_summs(TocaCon, TocaDis, TocaInt, scale = TRUE, plot.distributions = TRUE, 
           coefs=c("Total ISS"="D_ISSsum", "Total OSS"="D_OSSsum"), 
           robust=TRUE, point.shape=FALSE,
           model.names = c("Concentration", "Disruption", "Internalizing"),
           colors = "Qual3", legend.title="Model Outcome")
           

