#!/bin/bash
read -p "Compilar (y/n)?" yn
case $yn in
	[Yy]* ) echo "Compilando"
		cd "Cosas guays LaTeX"
		sudo ./install
		cd ..
		cd "Analisis Matematico"
		pdflatex Analisis_Matematico.tex
		cd ..
		cd "Estructuras Algebraicas"
		pdflatex Apuntes.tex
		cp Apuntes.pdf ..
		cd ..
		cd "Estadistica I"
		pdflatex EI.tex;;
	[Nn]* ) echo "Ok";;
        * ) echo "Please answer yes or no.";;
    esac
echo "Subiendo pdfs a Dropbox (en el directorio de vdj)"
cp "Analisis Matematico"/Analisis_Matematico.pdf .
cp "Estadistica I"/EI.pdf .
cp "Estructuras Algebraicas"/Apuntes.pdf .
mv Apuntes.pdf Est_Alg.pdf
echo "Introduce el path donde quiere copiar los archivos pdf: "
read directorio
find . -name *.pdf -print0 | xargs --null cp --target-directory=$directory
#cp *.pdf ~/Compartido/Dropbox/Doble\ Grado\ UAM\ \(1\)/TERCEROGILIS/Primer\ Cuatrimestre/Apuntes\ Latex/
#fi

