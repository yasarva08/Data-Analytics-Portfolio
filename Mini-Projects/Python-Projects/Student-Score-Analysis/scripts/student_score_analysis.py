import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns 

df = pd.read_csv("Student_score.csv")

print(df.shape) 

print(df.describe())

print(df.info())


print(df.isnull().sum())

###...............................DROP UNNAMED COLUMN ....................................................###

df = df.drop("Unnamed: 0" , axis=1)

print(df.head())


## change weekly study hours column 
df["WklyStudyHours"] = df["WklyStudyHours"].str.replace("05-Oct" , "5-10")
print(df.head())


####....................................GENDER DISTRIBUTION.................................................###


plt.figure(figsize=(5,5))
plt.title("Gender Distribution")
ax = sns.countplot(data = df , x = "Gender")

for bars in ax.containers:
    ax.bar_label(bars)
plt.show() 
# from the above chart we have analysed that the number of females in the data  is more than the numbers of males in the data ...

gb = df.groupby("ParentEduc").agg({"MathScore" : "mean" ,"ReadingScore" : "mean" , "WritingScore" : "mean"})
# print(gb)
sns.heatmap(gb , annot=True)
plt.title("Relationship between Parent's Education and Student's Score")
plt.show()
### from the above graph we have concluded that the education of the parents have a good impact on their studies 

gb1 = df.groupby("ParentMaritalStatus").agg({"MathScore" : "mean" ,"ReadingScore" : "mean" , "WritingScore" : "mean"})
print(gb1)
sns.heatmap(gb1 , annot=True)
plt.title("Relationship between parent's marital status and Student's Score")
plt.show()

### from the above chart we have concluded that there is no/negligible impact on the student's score due to parent marital status 


sns.boxplot(data= df , x= "MathScore")
plt.show()

sns.boxplot(data= df , x= "ReadingScore")
plt.show()

sns.boxplot(data= df , x= "WritingScore")
plt.show()


##..............................DISTRIBUTION OF ETHNIC GROUP ...........................................##

groupA = df.loc[(df["EthnicGroup"] == "group A")].count()
groupB = df.loc[(df["EthnicGroup"] == "group B")].count()
groupC = df.loc[(df["EthnicGroup"] == "group C")].count()
groupD = df.loc[(df["EthnicGroup"] == "group D")].count()
groupE = df.loc[(df["EthnicGroup"] == "group E")].count()

l = ["group A" , "group B" ,"group C" ,"group D", "group E" ]
mlist = [groupA["EthnicGroup"] ,groupB["EthnicGroup"] , groupC["EthnicGroup"], groupD["EthnicGroup"] , groupE["EthnicGroup"] ]


plt.pie(mlist , labels=l , autopct="%1.2f%%")
plt.title("DISTRIBUTION OF ETHNIC GROUP")
plt.show()