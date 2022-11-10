close all; clear all; clc
%On commence par d�finir les matrices qui correspondent aux r�ponses A,B et C
%La matrice A
a=[0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
   0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
   0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
   0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
   0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
   0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
   0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
   0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
   0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
%La matrice B
b=[1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1
   1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1
   1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1
   1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1
   1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1
   1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1
   1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1
   1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1
   1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1];
%La matrice C
c=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0
   1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0
   1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0
   1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0
   1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0
   1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0
   1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0
   1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0
   1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0];
%On transforme les les 3 matrices en leurs transpos�es 
aa=transpose(a);
bb=transpose(b);
cc=transpose(c); 
%On demande au professeur d'entrez le nombre de questions de l'examen
i=1;
n=input('entrez le nombre de question \n');
%On initialisize la matrice base
base=[];
%On demande au prof d'entrez les bonnes r�ponses � chaque question A=1,B=2
%et C=3
%Au fur et � mesure que le prof entre la bonne r�ponse construction
%des matrices targets et base par concatenation des transpos�es des
%matrices A,B et C
while(i<=n)
    prof(i)=input('entrez la bonne r�ponse ');
    switch prof(i)
    case 1
        base(:,i)=aa(:);
        targets(:,i)=[1;0];
    case 2
        base(:,i)=bb(:);
        targets(:,i)=[0;1];
    case 3
        base(:,i)=cc(:);
        targets(:,i)=[1;1];
    otherwise
        disp('Erreur')
        break
end
    i=i+1;
end
%Lecture de la photo de la copie de l'�tudiant
m1=imread('test1.jpeg');
%Transformation de la photo en mtrice
x1=im2bw(m1);
%Changement de la taille de la matrice de fa�on qu'elle devient de 27 bits
%en largeur et 9* nombres de questions en longueur
r= imresize(x1,[9*n,27]);
%Affichage de la matrice copie �tudiant
subplot(2,3,1), imshow(r)
%Decomposition de la matrice copie �tudiant selon le nombres de questions
%pour pouvoir comparer la r�ponse �mise pour chaque question avec la
%matrice correspondante � la bonne r�ponse
j=1;k=1;
t=[];
ri=[];
Ri=[];
while(j<=n*9 && k<=n )
   ri=r(j:j+8,:);
   Ri=transpose(ri);
   t(:,k)=Ri(:);
   j=j+9;
   k=k+1;
end 
%D�finition des param�tres du r�seau de neuronnes
tp=targets;
nb=243*n;%nombres des entr�es correspond aux nombres de bits de la matrices copie �tudiant 9*27*nombre de questions
nb=[nb 243 200 10 2];%la taille de la couche de sortie 2 
net=newff(minmax(base),nb,{'logsig','logsig','logsig','logsig','logsig'},'traincgp');
net.trainParam.epochs=30000;
net.trainParam.gool=1.0000e-025;
net.trainParam.lr=0.1;
%Entrainement du r�seau
[net tr]=train(net,base,targets);
results=sim(net, base);
Error=round(targets-results);
MeanSE=mse(Error);
%Simulation du r�seau
test=sim(net, t);
%Valeurs obtenus par test
test=round(test)
%Valeurs representants les bonnes r�ponses
tp
%Matrice erreur(difference entre les matrices test et tp)
Err=round(tp-test);
%Calcul des mauvaises r�ponses
res=0;
for i=1:n
    if(Err(1,i)~=0 || Err(2,i)~=0)
        res=res+1;
    end  
end
%Calcul de la bonne r�ponse par soustraction en consid�rant 1point/question 
n=n-res;
%Affichage de la bonne r�ponse
fprintf('La note finale est %d\n',n);
