# MOSH_Grau
# Projet capteur

## SOMMAIRE 
* 1 [Description du projet](#description)
* 2 [Shield](#paragraph2)
* 3 [Arduino](#paragraph3)
* 4 [APK](#paragraph4)  
* 5 [Banc de test](#paragraph5)
* 6 [Idées d'amélioration et de développement](#paragraph6)
   
   
   La plupart des iformations se trouvent dans la datasheet.

--------- 
## Description du projet <a name="description"></a>

Ce projet est réalisé dans le cadre de la formation en ingénierie physique de l'INSA Toulouse. Il vise à introduire le développement de technologies performantes, transportables et à moindre coût. 
Ce projet aborde de nombreuses notions : la physique des systèmes granulaires, l'électroniqe analogique, Arduino Uno, la réalisation d'un PCB, le développement d'APK, la conception d'un banc de test et la réalisation d'une datasheet.

*Objectif* : Développer une jauge de contrainte lowtech, carctérisée et documentée. 

*Description du capteur* : Le capteur est une feuille de papier sur laquelle est déposée une fine couche de graphite. Le graphite déposée peut être vu comme un film conducteur constitué de réseaux de percolation. La déformation du papier se répercute sur les réseaux de percolation et donc sur la conductivité du film de graphite. La déformation du papier est proportionnelle à la variation de conductivité du film de graphite[¹]. Afin d'avoir une mesure de meilleure qualité,et en raison des valeurs de résistance du capteur treès élevées, le signal est conditionné par un circuit analogique comprenant un amplificateur transimpédance et différents filtres. Un écran OLED piloté par un encodeur rotatoire permet d'étendre les fonctionnalités du capteur. Une application Android a également été développée pour faciliter l'utilisation du capteur, même si le capteur se suffit à lui même. L'application et le capteur communique via un module bluetooth. Le shield comprenant tous les composants électroniques s'enfiche sur une carte Arduino Uno.


*Livrables* : 

1. Shield : comprend un amplificateur transimpédance, différents étages de filtrage, un module bluetooth (HC-05), un écran OLED (SSD1306) et un encodeur rotatoire (KY-040). La résistance R2 peut être changée facilement afin d'adapter le gain de l'amplificateur en fonction de la résistance du capteur. 
2. Code Arduino : permet de piloter l'encodeur rotatoire et l'écran OLED. Un menu s'affiche à l'écran avec 3 fonctionnailités principales:
- choix de R2
- choix de l'affichage de différentes mesures en temps réel : soit la tension à la sortie de A0 (ADC sur 10 bits), soit la déformation longitudinale du capteur, ou bien la résistance du capteur. 
- Mesure de contrainte au niveau de la jauge de déformation en fonction du matériaux choisi.
- Calibration du capteur (sensibilité).

Gère les flux de données entre l'APK et le microcontrôleur via le module BT. Permet également d'effectuer les différents traitements de données, comme le calcul de la déformation longitudinale en fonction de la déflection ou encore le calcule de contrainte en fonction de la déformation et d'un certain matériau (module de Young). 

3. APK : Affichage en temps réel  de la tension à la sortie de A0 (ADC sur 10 bits) et tracé du graphe correspondant, affichage de la résistance du capteur, et affichage et modification de la valeur de R2. Un fonctionnalité permet de faire la moyenne des mesures sur 5 secondes. 




[¹]: https://www.nature.com/articles/srep03812



--------- 
## Banc de test <a name="paragraph5"></a>

### Description du banc de test ###


La solution choisie afin de tester et caractériser les capteurs est l'application d'une déflection en compression ou en traction. 

- Déflection en compression : on fixe le capteur au niveau de la partie la plus large, et on applique une déflection contrôlable et mesurable (par exemple avec une règle), perpendiculairement vers le haut (avec la couche de graphite sur la face supérieure du papier) et à l'extrèmité de la jauge pour qu'elle se replie sur elle-même. 
- Déflection en traction : idem qu'en compression mais avec une délection provoquée par une froce dirigée vers le bas (avec la couche de graphite sur la face supérieure du papier). Plus difficile à mettre en oeuvre pour des raisons pratiques, notamment pour mesurer la déflection correctement. On peut alors s'aider de poids que l'on suspend à l'extrémité de la jauge. 

 <img src=https://github.com/MOSH-Insa-Toulouse/MOSH_Grau/blob/main/images/photo_banc.jpg width="200">
 
 On mesure ainsi la variation de résistance relative en fonction de la déflection. En considérant notre capteur comme une poutre, avec de petites déformation nous pouvons alor remonter à la déformation logitudinale du capteur et calculer son facteur de jauge. Il est important que les prises de contact soient immobiles tout au long de la mesure pour ne pas fausser celle-ci. 
 Il faut également toucher le moins possible la couche de graphite du capteur pour ne pas biaiser les mesures.
 Pour effectuer nos mesures, noud avons moyenné chaque point sur 5 secondes à une fréquence dacquisition de 5Hz. L'incertitude de chaque mesure correspond à l'écart type de l'ensemble des échantillons correspondants à la mesure (voir APK).
 La défelction maximale appliquée est de 2 cm, au delà la déformation du capteur devient trop importante et il se peut que celui-ci se retrouve déformé de manière irréversible. 
 
 

 
  

**Paramètres étudiés :**

*Paramètres contrôlables :*

1. Type de papier : 
- Papier canson, 180 g/m², épaiseur : 0,21mm
- Feuille A4 de bureau standard, 80 g/m², épaisseur : 0,08mm,
- Fiche Bristol, 205 g/m², épaisseur : 0,22mm

2. Type de crayon : De 4H à 4B
3. Forme de la jauge, notamment la surface de la couche de graphite, la longueur du motif de graphite etc... 
4. Influence de la résistance nominale
5. Influence de R2

*Paramètres non contrôlables :*

1. Formation des réseaux de percolation
2. Epaisseur de la couche de graphite
3. Homogénéité de la couche de graphite

### Influence de R2 sur la mesure ###

La résistance R2 permet d'adapter le gain de l'amplificateur. Il permet notamment de déterminer la plage de résistance mesurable : 




###Idées d'amélioration et de développement <a name="paragraph6"></a>


- Réfléchir à un moyen de déposer le graphite de manière plus homogène
- Continuer à étudier les différents paramètre : dimensions de la jauge de graphite, dimensions du motif de graphite
- Réfléchir à une prise de contact plus appropriée, avec des électrodes fixes
- Continuer à prendre des mesures pour préciser ou réfuter la relation entre la résistance nominale et le facteur de jauge
- Faire les mesures en compression
- Automatiser le banc de test, en fixant tout simplement un fil au bout de la jauge, avec l'autre bout du fil accroché à un servomoteur. L'angle de rotation du servo-moteur est directement relié à la déflection de la jauge. 
- Optimiser le code de l'APK, et de l'Arduino, ajout de nouvelles fonctionnalités






