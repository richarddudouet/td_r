#_____________________________________________________________________________
#_____________________________________________________________________________
#_____________________________________________________________________________
#_____________________________________________________________________________----
# TITRE DU SCRIPT: Préparation des données pour initiation td r----
## Date de dernière modification : 18/09/2025 ----
#.----
#_____________________________________________________________________________----
#_____________________________________________________________________________
#_____________________________________________________________________________
#_____________________________________________________________________________
library(NHANES)
data(NHANES)

nhanes=unique(NHANES) # Je remove les doublons

nhanes_educ=nhanes %>% 
  select (ID,
          Education
          ) %>%
  group_by(ID) %>%
  mutate(number_survey = row_number()) %>%
  ungroup()


nhanes_uniqID=nhanes %>% 
  subset(!duplicated(ID))%>%
  group_by(ID) %>%
  mutate(number_survey = row_number()) %>%
  ungroup() %>% 
  select(-Education)
  


write.csv2(nhanes_educ,
           file = "TD1/Data/nhanes_educ.csv") # csv2 pour faire le piège des ;

library(writexl)
write_xlsx(nhanes_uniqID,
           path="TD1/Data/nhanes.xlsx") 


summary(d_join$number_survey)


d_educ %>% 
  subset(duplicated(ID)) %>% nrow
saveRDS(d_join,
        file="TD1/Data/d_with_educ_s1.rds")

?unique

class(d)# C'est un dataframes
# Qu'est ce qu'un dataframe ? 
# Suite ordonnée de valeurs du même type (nombre, caractère, logique etc)
type(d)

# Pour Backup ou enregistrer les modifications : 
save.image("C:/Users/richa/Desktop/Travail/4. Enseignement/td_r/TD1/Data/envtd1.RData")
rm(NHANES)
saveRDS(object = d,
        file = "TD1/Data/nhanes_d_10.09.2025.rds") # ne pas oublier l'extension

write.csv(x=d,
          file = "TD1/Data/nhanes_d.csv") # ne pas oublier l'extension

library (writexl)
?writexl
write_xlsx(x = d,
           path="TD1/Data/nhanes_d.xlsx")

# enregistrer le tableau avec seulements quelques variables
# Plusieurs options :
names(d)
ls(d)
#Appel d'une variable : 
d[,"Gender"]
d$Gender
typeof(d$Gender)
d %>% 
  select(Gender) # Equivalent de d$Gender 
# Fonctionnement du Pipe: l'objet avant remplace le premier argument 
# de la fonction
# En lecture en français cela fait "prend d PUIS selectionne GENDER"


# L'enregistrer d'abord dans l'environnement puis enregistrer l'objet
d_gender<-d %>% 
  select(Gender)

# En français: Creer l'objet d_gender dans lequel tu mettra ce qui suit:
# prends d PUIS sélectionne Gender 

write_xlsx(x = d_gender,
           path="TD1/Data/nhanes_d_gender.xlsx")

 
# On peut également remplacer l'ancienne base avec une nouvelle:
d<-d %>% 
  select(Gender)
# Probleme on a plus la base de travail ! 

# Supprimer un élément de l'environnement: 
rm(d) # rm comme remove
# Je re créer une base de travail de base :
d<- NHANES






nhanes_100=read_excel("TD1/Data/nhanes.xlsx", # path
           1, # numéro de la feuille
           n_max=100) #arrête toi à 100 lignes


nhanes_100<-read_excel("TD1/Data/nhanes.xlsx", # path
                       1, # numéro de la feuille
                       100) #arrête toi à 100 lignes






{r}
# 1. Je compare le nombre de lignes
nrow(d)==nrow(d_educ) 
# nrow= littéralement nombre de row=lignes.
# == comme dans stata est un opérateur logique, si les tailles sont égales, la sortie sera TRUE sinon FALSE. 
# Un opérateur logique est un symbole qui permet de comparer des valeurs, la sortie sera donc toujours vrai ou faux. 

# == → égal à
# != → différent de
# <, <= → plus petit, plus petit ou égal
# >, >= → plus grand, plus grand ou égal

# On peut aussi faire une simple soustraction du nombre de ligne de chaque dataframes: 
nrow(d_educ)-nrow(d)

#2. Y a t il le même nombre d'individus?
# Plusieurs méthodes : 
## 1) Comprendre sa base de données :
## Ici on comprend vite que number_survey est une variable qui à l'air de donnée le numéro de la vague de récolte de donnée sur des données potentiellement répétés -> Je vais m'en assurer en analysant cette variable. 

summary(duplicated(d$ID))
summary(duplicated(d_educ$ID))
# La fonction summary() en R fait un résumé adapté au type d’objet que tu lui donnes.
# 
# Si c’est un vecteur numérique → elle donne les statistiques descriptives de base :
# Min., 1st Qu., Median, Mean, 3rd Qu., Max.
# 
# Si c’est un facteur (catégoriel) → elle donne les effectifs de chaque modalité.
# 
# Si c’est un data.frame → elle applique summary() à chaque colonne, donc :
# 
# colonnes numériques → résumé statistique,
# 
# colonnes facteurs → fréquences,
# 
# colonnes logiques → nombre de TRUE/FALSE.



unique(d_educ$number_survey)

differences=anti_join(x= d_educ, # x= premier argument = df le plus grand
                      y= d)
# ? anti_join -> return all rows from x without a match in y
# Ce qu'on observe en regardant les données c'est que number_survey à l'air 
# d'être toujours supérieur à 1. 
# On va s'en assurer : 

summary(differences$number_survey) #C'est le cas. Vous comprenez la logique?
summary(d$number_survey) # Il n'y a que des 1

# Nous avons confirmé que la différence vient bien de ce number survey


library(tidyverse)
library(crosstable)


crosstable()

d %>% names








?left_join


















