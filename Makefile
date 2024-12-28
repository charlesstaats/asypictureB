all: asypictureB.sty asypictureB.pdf asyerrorexample-error_example_errors.txt

asypictureB.sty: asypictureB.ins asypictureB.dtx
	tex asypictureB.ins

asypictureB.pdf: asypictureB.dtx asypictureB.sty
	pdflatex -shell-escape asypictureB.dtx
	makeindex -s gind.ist asypictureB
	pdflatex asypictureB.dtx
	pdflatex asypictureB.dtx

asyerrorexample-error_example_errors.txt: asyerrorexample.tex asypictureB.sty
	pdflatex -shell-escape -interaction=nonstopmode asyerrorexample.tex || true

clean:
	rm -f asypictureB.sty asypictureB.pdf *.aux *.dvi *.log *.idx *.ind *.toc *.out *.glo *.hd *.ilg *.asy asypictureB-*.png asypictureB-*.pdf asypictureB-compile_asy.sh *_errors.txt