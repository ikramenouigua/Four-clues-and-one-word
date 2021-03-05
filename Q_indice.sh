#!/bin/sh

#les codes des couleurs pour language shell
Blue='\033[0;34m'
Yellow='\033[0;33m'
Green0='\033[0;32m'
Green1='\033[1;32m'
Green2='\033[2;32m'
NC='\033[0m'
Red='\033[1;35m'
mov='\033[1;35m'
Cyan='\033[0;36m'
bbl='\033[1;34;34m'
byl='\033[2;33'
l='\033[2;33m'
BCvan='\033[1;36m'
clear


                             #la fonction se connecter a un compte deja existe

                    #la fonction s_inscrire a un nouveau compte
s_inscrire(){
echo "entrez votre nom"
read nom
         #teste si le nom est vide
if [ -z $nom ] 
  then
  echo "le nom est invalide"
  sleep 2
  echo "entrez un nom valide si vous voulez"
  read nom
       #cherche si nom est deja utilise dans le fichier joueur.txt
  elif cat joueur.txt | grep -qw "$nom"                                                  
  then
    echo "Le nom d'utilisateur $nom existe déja."
    echo "Sélectionnez un autre nom d'utilisateur."
    s_inscrire
    sleep 2
 fi
echo "entrez votre mot de pass"
read password
         #teste si le mot de passe est une chaine vide
 if [ -z $password ] 
  then
  echo "le mot de passe est vide"
  echo " entrez un mot de passe qui contient des caracteres "                 
 fi
echo $nom:$password>>joueur.txt          #introduire une fichier pour conserver le nom et le mot de passe

echo "bienvenue $nom vous etes inscrit avec succes"
sleep 2
echo "----Debutez le jeu maintenant------------"
Menu_Depart

}
            # le premier menu affiche au depart du jeu
Menu_Depart(){
while true
do
echo "cher $nom voila la menu :$bbl "
echo "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒"
echo "▒▒                      1-Pour s_inscrire                           $red ▒▒"
echo "▒▒                      2-Pour se connecter                          ▒▒"   
echo "▒▒                      3-Pour comprendre le but du jeu              ▒▒"
echo "▒▒                      4-Pour quitter                               ▒▒"
echo "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒"
sleep 3
echo "  $Red Entrez le nombre de votre choix "
read x
case $x in
      1) s_inscrire;; 
      2)se_connecter;;
      3) echo "Le jeu QUATRE_INDICES_ET_UN_MOT consiste a trouver un mot a partir de quatre indices,c'est tres simple comme  principe mais parfois on se trouve face a des mots introuvables et les credits qu-on peut avoir de la banque ne nous donnent pas assez de marge pour les rembourser.
En effet chaque mot trouve sera comptabilise par un nombre de points selon le niveau du jeu par exemple dans le niveau 1 pour chaque mot trouve an va gagner 4 points et si le mot est incorrecte ce score va diminuer d'un point et le jeu egalement 
pour niveau 2 ona le score max est egale a 6 et la score min est egal a 2
pour niveau 3 on a le score max est egale a 8 et le score min est egale a 4 
maintenant vous comprenez le jau donc allez commencez ";;
      4) exit;;
      *) echo "entrez votre choix s'il vous plait !!"
esac
clear
echo "entrez votre choix s'il vous plait !!"
done

}
clear
#*******************************************************supprimer un compte existe*************
Desabooner_joueur()
{
  echo "\n"
  grep -vwE "($nom)" joueur.txt > joueur1.txt
  
  mv joueur1.txt  joueur.txt
  grep -vwE "($nom)" Sauvegarde.txt > Sauvegarde2.txt
  rm Sauvegarde.txt
  mv Sauvegarde2.txt  Sauvegarde.txt
  echo "Votre session  est maintenant supprimée"
}
#fonction qui cherche les mots dans le fichier tirage niveau3 et calcule le score de chaque mot individuellemet
TirageNiveau1(){        
i=0
t1=`(sort -R Tiragetest.txt | cut -d : -f3-6|head -$1)`
echo $t1
score_max=`grep "$t1" TirageNiveau1 | cut -d : -f7`
score_min=`grep "$t1" TirageNiveau1 | cut -d : -f8`
motrecherche=` grep "$t1" TirageNiveau1|cut -d : -f2 `
 

echo "donner le mot"
read mot
score=$score_max
if [ "$mot" = "$motrecherche" ]
then
 echo "bravo vous avez gagne votre score est $score"
else
   while [ "$mot1" != "$motrecherche" ]
     do
     echo " mot est incorrecte"
     echo "tapez le mot "
    read mot1
            score=$((score-score_min))
           i=$((i+1))
           done 
     echo "vous avez gagne"
    sleep 2
    echo " votre score est $score .CONTINUEZ"
    
    sleep 2
fi
tirage="tirageniveau1"
grep -vwE "($t1)" Tiragetest.txt > tmptirage.txt
rm Tiragetest.txt
  mv tmptirage.txt  Tiragetest.txt
}
#fonction qui cherche les mots dans le fichier tirage niveau2 et calcule le score de chaque mot individuellemet.
TirageNiveau2(){        
i=0
t1=`(sort -R Tiragetest.txt | cut -d : -f3-6|head -$1)`
echo $t1

score_max=`grep "$t1" TirageNiveau2 | cut -d : -f7`
score_min=`grep "$t1" TirageNiveau2 | cut -d : -f8`
motrecherche=` grep "$t1" TirageNiveau2|cut -d : -f2`
 

echo "donner le mot"
read mot
score=$score_max
if [ $mot = $motrecherche ]
then
 echo "bravo vous avez gagne votre score est $score"
else
   while [ "$mot1" != "$motrecherche" ]
     do
     echo " mot est incorrecte"
     echo "tapez le mot "
    read mot1
            score=$((score-score_min))
           i=`expr $i + 1`
           done 
     echo "vous avez gagne"
    sleep 2
    echo " votre score est $score .CONTINUEZ"
    sleep 2
fi
tirage="tirageniveau2"
grep -vwE "($t1)" Tiragetest.txt > tmptirage.txt
rm Tiragetest.txt
  mv tmptirage.txt  Tiragetest.txt
}

#fonction qui cherche les mots dans le fichier tirage niveau3 et calcule le score de chaque mot individuellemet.
TirageNiveau3(){        
i=0
t1=`(sort -R Tiragetest.txt | cut -d : -f3-6|head -$1)`
echo $t1
score_max=`grep "$t1" TirageNiveau3 | cut -d : -f7`
score_min=`grep "$t1" TirageNiveau3 | cut -d : -f8`
motrecherche=`grep "$t1" TirageNiveau3|cut -d : -f2`
 
echo "donner le mot"
read mot
score=$score_max
if [ $mot = $motrecherche ]
then
 echo "bravo vous avez gagne votre score est $score"
else
   while [ "$mot1" != "$motrecherche" ]
     do
     echo " mot est incorrecte"
     echo "tapez le mot "
    read mot1
            score=$((score-score_min))
           i=`expr $i + 1`                      #l'indice i compte le nombre des tape du mot par le joueur
           done 
     echo "vous avez gagne"
    sleep 2
    echo " votre score est $score .CONTINUEZ"
    sleep 2
fi
tirage="tirageniveau3"
grep -vwE "($t1)" Tiragetest.txt > tmptirage.txt
rm Tiragetest.txt
  mv tmptirage.txt  Tiragetest.txt

}
#******************************fonction de tirageniveau1 contient 3 mots ****************************************
Tirage_1(){
echo "BIENVENUE DANS LE TIRAGE NIVEAU1"


echo "      $Cyan   ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ "
echo "         ▒▒ ▒▒          TIRAGE NIVEAU 1         ▒▒ ▒▒ "
echo "         ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ $Red"   
                #maintenant on debute le jeu voila le premier tirage
touch Tiragetest.txt
cp TirageNiveau1 Tiragetest.txt   
j=0
TirageNiveau1 1
score1=$score
echo "votre score est $score1"
j=$((j+1))
saving $score1         #sauvegarder le score
echo "\n"
echo "\n"
TirageNiveau1 1
score2=$((score1+score))
echo "votre score est $score2"
j=$((j+1))
saving $score2          #sauvegarder le score

echo "\n"
echo "\n"
TirageNiveau1 1
score3=$((score2+score))
echo "votre score est $score3"
j=$((j+1))
rm -r  Tiragetest.txt
saving $score3           #sauvegarder le score
clear 




  }
#************************fonction de tirage niveau2****************************
Tirage_2(){
echo "                 $Cyan ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ "
echo "                  ▒▒ ▒▒         TIRAGE NIVEAU 2          ▒▒ ▒▒ "
echo "                  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ $Red"   
touch Tiragetest.txt
cp TirageNiveau2 Tiragetest.txt


TirageNiveau2 1
score4=$((score3+score))
echo "votre score est $score4"
j=$((j+1))
saving $score4     
echo "\n"             #sauvegarder le score
echo "\n"
TirageNiveau2 1
score5=$((score4+score))
echo "votre score est $score5"
j=$((j+1))
saving $score5               #sauvegarder le score
echo "\n"
echo "\n"
TirageNiveau2 1
score6=$((score5+score))
echo "votre score est $score6"
j=$((j+1))
rm -r Tiragetest.txt
saving $score6                  #sauvegarder le score

echo "\n"

echo "\n"
echo "\n"
clear
}
#***************************fonction de tirage niveau 3**************************
Tirage_3(){
echo "            $Cyan  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ "
echo "              ▒▒ ▒▒         TIRAGE NIVEAU 3          ▒▒ ▒▒ "
echo "              ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ $Red"   
touch Tiragetest.txt
cp TirageNiveau3 Tiragetest.txt

echo "\n"
TirageNiveau3 1
score7=$((score6+score))
echo "votre score est $score7"
j=$((j+1))
saving $score7                       #sauvegarder le score
echo "\n"
echo "\n"
TirageNiveau3 1
score8=$((score7+score))
echo "votre score est $score8"
echo "\n"
echo "\n"
j=$((j+1))
saving $score8                      #sauvegarder le score
TirageNiveau3 1
score9=$((score8+score))
echo "votre score est $score9"
j=$((j+1))
rm -r  Tiragetest.txt
saving $score9                 #sauvegarder le score
clear
echo "################################################################################################"
echo "                      BRAVO VOUS AVEZ TERMINE LE JEU AVEC SUCCES "
echo "                           Votre score final est $score9 "
echo "################################################################################################"
Menu_Fin_Tirage


}
#*************************la fonction tirage contient trois niveaux*************
Tirage(){
Tirage_1
Tirage_2
Tirage_3
}
#cette fonction pour completer une partie deja debute


Continue_Tirage(){

scorex=$(grep -w $nom Sauvegarde.txt|tail -1|cut -d : -f 4)          #le dernier score obtenu apres la derniere fois de jeu
tirage=$(grep -w $nom Sauvegarde.txt|tail -1|cut -d : -f 2)            #le dernier tirage apres la derniere fois du jeu.
j=$(grep -w $nom Sauvegarde.txt|tail -1| cut -d : -f 3)                #le dernier mot apres la derniere fois du jeu.

 if [ $j -eq 1 ]                       #si on sort du jeu apres le premier mot
    then
       TirageNiveau1 1
         score2=$((scorex+score))
        echo "votre score est $score2"
      j=$((j+1))
      saving $score2
      TirageNiveau1 1
      score3=$((score2+score))
      echo "votre score est $score3"
      j=$((j+1))
       rm -r Tiragetest.txt
       saving $score3
        Tirage_2
        Tirage_3
       elif [ $j -eq 2 ]           #si on sort du jeu apres le 2eme mot
          then
           TirageNiveau1 1
      score4=$((scorex+score))
      echo "votre score est $score4"
      j=$((j+1))
       rm -r Tiragetest.txt
       
       saving $score4
       clear
          Tirage_2
          Tirage_3
          
     elif [ $j -eq 3 ]             ##si on sort du jeu apres le 3eme mot
      then 
        score3=$scorex 
       
         
          Tirage_2
          Tirage_3


        elif [ $j -eq 4 ]             #si on sort du jeu apres le 4eme mot
          then

           TirageNiveau2 1
           score5=$((scorex+score))
           echo "votre score est $score5"
           j=$((j+1))
           saving $score5
           
           TirageNiveau2 1
           score6=$((score5+score))
           echo "votre score est $score6"
            j=$((j+1))
            rm -r Tiragetest.txt
           saving $score6
           clear
            
           
           echo "\n"
           Tirage_3
            elif [ $j -eq 5 ]          #si on sort du jeu apres le 5eme mot
               then
             TirageNiveau2 1
             score6=$((scorex+score))
              echo "votre score est $score6"
              j=$((j+1)) 
              rm -r Tiragetest.txt
             saving $score6
             echo "\n"
             Tirage_3

     elif [ $j -eq 6 ]             #si on sort du jeu apres le 6eme mot
      then 
          
        score6=$scorex 
          Tirage_3
        elif [ $j -eq 7 ]     #si on sort du jeu apres le 7eme mot
          then
           

           TirageNiveau3 1
           score8=$((scorex+score))
           echo "votre score est $score8"
           j=$((j+1))
           saving $score8
           
           TirageNiveau3 1
           score9=$((score8+score))
           echo "votre score est $score9"
            j=$((j+1))
           rm -r  Tiragetest.txt
           saving $score9
           
           echo "\n"
           clear
           echo "################################################################################################"
           echo "                      BRAVO VOUS AVEZ TERMINE LE JEU AVEC SUCCES "
           echo "                           Votre score final est $score9 "
           echo "################################################################################################"
            Menu_Fin_Tirage

            elif [ $j -eq 8 ]      #si on sort du jeu apres le 8eme mot
               then
 

             TirageNiveau3 1
             score9=$((scorex+score))
              echo "votre score est $score9"
              j=$((j+1))
             rm -r Tiragetest.txt
             saving $score9 
             echo "\n"
             clear
            echo "################################################################################################"
            echo "                      BRAVO VOUS AVEZ TERMINE LE JEU AVEC SUCCES "
            echo "                           Votre score final est $score9 "
            echo "################################################################################################"
            Menu_Fin_Tirage

fi

}

#______________la fonction qui cherche est ce qu'il y a une partie sauvegarde ou non apres la connexion a un compte existee
Tirage_Sauvegarde()
{
#on cherche le nom d'utilisateur dans le fichier sauvegarde
  if grep -qw $nom Sauvegarde.txt           
  then
     Continue_Tirage
  else
    echo "\n"
    echo "Vous n'avez aucun partie sauvegarder, essayez de debuter une partie.\n"
  Tirage
    sleep 2
  fi
}
#*********************la fonction se connecter a un compte existe************
se_connecter(){                       
i=0
while [ $i -eq 0 ]   #une boucle qui teste jusque'a trouve un nom sauvegarder  .       
do
echo " donner le nom "
read   nom
i=`cut -f1 -d: joueur.txt |grep -c $nom`      #cherche le nom dans le fichier joueur
if [ "$i" = 0 ]
then
echo " le nom n'existe pas"
fi
done
j=0
while [ $j -eq 0 ]    #la boucle while arrete jusque'a trouve le mot de passe correcte
do
echo "donner le mot de passe"
stty echo
read  password
j=`cut -f1,2 -d: joueur.txt |grep -c $nom:$password` #cherche le mot de passe qui appartient au nom indique
if [ "$j" = 0 ]
then 
echo "  le mot de passe n'existe pas "
fi
done
clear
#______________________________________________apres la connexion ce menu apparait au joueur
while true
do
echo "Bienvenue dans votre compte $nom "
    echo "$Green1         ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒     "                 
    echo "         ░░ 1- Pour revenir au menu principale                 ░░     "                   
    echo "         ░░ 2-Pour completer une session deja debute           ░░     "
    echo "         ░░ 3-Pour jouer la premiere foix                      ░░     "
    echo "         ░░ 4-Pour supprimer ce compte                         ░░     "                               
    echo "         ░░ 5-Pour quitter le jeu                              ░░     "
    echo "         ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒     "                   
 
    echo "$Red Veuillez entrer le numero de votre choix " 
     read y

   case $y in                                                                                
      1) Menu_Depart;;                                                                                     
      2) Tirage_Sauvegarde;;                                                                   
      3) Tirage;;   
      4) Desabooner_joueur
         echo "votre session est supprimer maintenant ";;
      5) exit;;                                                                              
                                                                                                                                                                       
      *) echo "Sélectionnez un numero s'il vous plait";;                                             
    esac   
clear
echo " Sélectionnez un numero s'il vous plait"
done                                                                                     
}


#***********************************************************************************************************************************************************************************************************
saving()
{
  echo "$nom:$tirage:$j:$1" >> Sauvegarde.txt
}
 
#le menu obtenue a la fin du jeu 

Menu_Fin_Tirage(){
echo "*********************************************************************"
echo " $Cyan VOILA $nom VOUS ETES COMPLETER LA JEU AVEC SUCCES "
sleep 2
while true
do
echo "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒"
echo "▒▒            1-Pour rejouer                                         ▒▒"
echo "▒▒            2-pour supprimer ce compte                             ▒▒"
echo "▒▒            3-Pour quitter le jeu                                  ▒▒"
echo "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒"
echo "Voici le menu Tapez votre choix"
read z
case $z in
     1)Menu_Depart;;
     2)Desabooner_joueur;;
     3)exit;;
esac
clear
echo "tapez un choix s'il vous plait"
done
 }



#*************************************si on sort du jeu apres le premier mot
echo "$BCvan              ***************************************************************************************************       "
echo "               *▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒*         "
echo "               *▒▒▒▒                                                                                         ▒▒▒▒*       "
echo "               *▒▒▒▒                                            //|                                          ▒▒▒▒*       "
echo "               *▒▒▒▒                                           //||                                          ▒▒▒▒* "
echo "               *▒▒▒▒                                          // ||                                          ▒▒▒▒* "
echo "               *▒▒▒▒                                         //  ||                                          ▒▒▒▒* "
echo "               *▒▒▒▒                                        //   ||                                          ▒▒▒▒*            "
echo "               *▒▒▒▒          BIENVENUE DANS LE JEU        /////////////      _INDICES_ET_UN_MOT             ▒▒▒▒*   " 
echo "               *▒▒▒▒                                             ||                                          ▒▒▒▒*  "
echo "               *▒▒▒▒                                             ||                                          ▒▒▒▒*             "
echo "               *▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒*          "
echo "               ***************************************************************************************************      $Red"
echo "\n"
echo "\n"
echo "\n"
echo "\n"
echo "\n"
Menu_Depart

