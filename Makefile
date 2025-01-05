all: asypictureB.sty asypictureB.pdf asyerrorexample-error_example_errors.txt asypictureb.zip

asypictureB.sty: asypictureB.ins asypictureB.dtx
	tex asypictureB.ins

asypictureB.pdf: asypictureB.dtx asypictureB.sty
	pdflatex -shell-escape asypictureB.dtx
	makeindex -s gind.ist asypictureB
	pdflatex asypictureB.dtx
	pdflatex asypictureB.dtx

asyerrorexample-error_example_errors.txt: asyerrorexample.tex asypictureB.sty
	pdflatex -shell-escape -interaction=nonstopmode asyerrorexample.tex || true

asypictureb.zip: asypictureB.sty asypictureB.pdf asypictureB.dtx asypictureB.ins README
		[ -d asypictureb ] && rm -rf asypictureb/{*,.[!.]*,..?*} || mkdir asypictureb
		cp $^ asypictureb/
		zip -Xr asypictureb.zip asypictureb
		[ -d asypictureb ] && rm -rf asypictureb

clean:
	rm -f asypictureB.sty asypictureB.pdf *.aux *.dvi *.log *.idx *.ind *.toc *.out *.glo *.gls *.hd *.ilg *.asy asypictureB-*.png asypictureB-*.pdf asypictureB-compile_asy.sh *_errors.txt asypictureb.zip