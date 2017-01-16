{ ALGORITHME du programme:
	
programme Carre_magique

CONST
	taille = 5

type
	Tableau=TABLEAU[1..taille,1..taille] en ENTIER


//BUT initialiser le tableau avec des 0
//ENTREE 4 entiers et un tableau
//SORTIE le tableau, initialisé à 0 et 2 entiers initialisés
procedure initTab (var Tab:Tableau var x,y:ENTIER)
var i,j :ENTIER

DEBUT
	POUR i <- 1 à taille FAIRE
	DEBUT
		POUR j<- 1 à taille FAIRE
		DEBUT
			Tab[i,j]<-0
		FINPOUR
	FINPOUR

	//placement du 1

	x<-((taille-1) div 2)
	y<-((taille+1) div 2)
FINPROCEDURE

//BUT Afficher le tableau
//ENTREE 2 entiers et un tableau
//SORTIE affiche àut le tableau
procedure AfficheTab(var Tab:Tableau)
var 
i,j :ENTIER
DEBUT
POUR i <- 1 à taille FAIRE
DEBUT
	POUR j<- 1 à taille FAIRE
	DEBUT
		ECRIRE Tab[i,j] & ' '
	FINPOUR
	ECRIRE
FINPOUR
FINPROCEDURE

//BUT comparer si x ou y est au dessus de taille ou en dessous de 1, et le corriger
//ENTREE 2 entiers
//SORTIE 2 entiers corrigés
procedure CompareTab(var x,y:ENTIER)
DEBUT
	//systeme pour que 6=1, 7=2 etc
	SI x>taille ALORS
		x<-x-taille
	FINSI
	SI y>taille ALORS
		y<-y-taille
	FINSI
	//systeme pour que -1=5 -2=4 etc
	SI x<1 ALORS
		x<-x+taille
	FINSI
	SI y<1 ALORS
		y<-y+taille
	FINSI
FINPROCEDURE

//BUT remplir le tableau de 1 à taille
//ENTREE 3 entiers et un tableau
//SORTIE le tableau , prêt à être affiché
procedure RempliTab(var Tab:Tableauvar x,y:ENTIER)
//génération automatique du tableau à parir du 1
var
	i:ENTIER
DEBUT
	POUR i<-1 à taille*taille FAIRE
	DEBUT
		CompareTab(x,y)
		//systeme pour que si une case est occupée, on déplace au nord-ouest
		SI Tab[x,y]<>0 ALORS
			x<-x-1
			y<-y-1
			CompareTab(x,y)
		FINSI

		//on entre la FAIREnnée dans le tableau

		Tab[x,y]<-i

		//on se déplace dans le tableau au prochain placement
		x<-x-1
		y<-y+1

	FINPOUR
FINPROCEDURE
//début du corps du programme

//BUT créer un carré magique adaptable en 5x5 ou 7x7
//ENTREE Un tableau
//SORTIE Le tableau a deux dimensions affichant le carré magique

var
	i,j,x,y:ENTIER
	Tab:TABLEAU

DEBUT

ECRIRE "Voici un carré magique de " & taille & " x " & taille

initTab(Tab,x,y) //initialisation du tableau
RempliTab(Tab,x,y) //remplissage du tableau
afficheTab(Tab) //affichage du tableau
FIN.

___________________________________________________________________________________________________________
}

program Carre_magique;

uses crt;

CONST
	taille = 5; //modifier ici par 7 pour un carré magique de 7x7

type
	Tableau=array[1..taille,1..taille] of integer;


//BUT initialiser le tableau avec des 0
//ENTREE 4 entiers et un tableau
//SORTIE le tableau, initialisé à 0 et 2 entiers initialisés
procedure initTab (var Tab:Tableau; var x,y:integer);
var i,j :integer;

BEGIN
	for i := 1 to taille do
	begin
		for j:= 1 to taille do
		begin
			Tab[i,j]:=0;
		end;
	end;

	//placement du 1

	x:=((taille-1) div 2);
	y:=((taille+1) div 2);
END;

//BUT Afficher le tableau
//ENTREE 2 entiers et un tableau
//SORTIE affiche tout le tableau
procedure AfficheTab(var Tab:Tableau);
var 
i,j :integer;
BEGIN
for i := 1 to taille do
	begin
		for j:= 1 to taille do
		begin
			write(Tab[i,j],' ');
		end;
		writeln;
end;
END;

//BUT comparer si x ou y est au dessus de taille ou en dessous de 1, et le corriger
//ENTREE 2 entiers
//SORTIE 2 entiers corrigés
procedure CompareTab(var x,y:integer);
BEGIN
	//systeme pour que 6=1, 7=2 etc
if x>taille then
	x:=x-taille;
if y>taille then
	y:=y-taille;
//systeme pour que -1=5 -2=4 etc
if x<1 then
	x:=x+taille;
if y<1 then
	y:=y+taille;
END;

//BUT remplir le tableau de 1 à taille
//ENTREE 3 entiers et un tableau
//SORTIE le tableau , prêt à être affiché
procedure RempliTab(var Tab:Tableau;var x,y:integer);
//génération automatique du tableau à parir du 1
var
	i:integer;
BEGIN
	for i:=1 to taille*taille do
	begin
		CompareTab(x,y);
		//systeme pour que si une case est occupée, on déplace au nord-ouest
		if Tab[x,y]<>0 then
			begin
				x:=x-1;
				y:=y-1;
				CompareTab(x,y);
			end;

		//on entre la donnée dans le tableau

		Tab[x,y]:=i;

		//on se déplace dans le tableau au prochain placement
		x:=x-1;
		y:=y+1;

	END;
END;
//début du corps du programme

//BUT créer un carré magique adaptable en 5x5 ou 7x7
//ENTREE Un tableau
//SORTIE Le tableau a deux dimensions affichant le carré magique

var
	i,j,x,y:integer;
	Tab:Tableau;

BEGIN
clrscr;

writeln('Voici un carre magique de ',taille,' x ',taille); 
writeln;
initTab(Tab,x,y); //initialisation du tableau
RempliTab(Tab,x,y); //remplissage du tableau
afficheTab(Tab); //affichage du tableau
readln();
END.