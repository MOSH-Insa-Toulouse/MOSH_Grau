# MOSH_Grau
# Projet capteur

## SOMMAIRE 
* 1 [Description du projet](#description)
* 2 [Shield](#paragraph2)
* 3 [Arduino](#paragraph3)
* 4 [APK](#paragraph4)  
* 5 [Banc de test](#paragraph5)
* 6 [Datasheet](#paragraph6)
   

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
- choix de l'affichage de différentes mesures en temps réel : soit la tension à la sortie de A0 (ADC sur 1024 bits), soit la déformation longitudinale du capteur, ou bien la résistance du capteur. 
- Mesure de contrainte au niveau de la jauge de déformation en fonction du matériaux choisi.
- Calibration du capteur en fonction de la résistance nominale (relation de linéarité entre la résolution du capteur et la résistance nomninale).

Gère les flux de données entre l'APK et le microcontrôleur via le module BT. Permet également d'effectuer les différents traitements de données, comme le calcul de la déformation longitudinale en fonction de la déflection ou encore le calcule de contrainte en fonction de la déformation et d'un certain matériau (module de Young). 

3. APK : Affichage en temps réel  de la tension à la sortie de A0 (ADC sur 1024 bits) et tracé du graphe correspondant, affichage de la résistance du capteur, et affichage et modification de la valeur de R2.




[¹]: https://www.nature.com/articles/srep03812
