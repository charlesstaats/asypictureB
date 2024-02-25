$pdf_mode = 1;
@default_files = ('asypictureB.dtx');

# Copied from https://raw.githubusercontent.com/vectorgraphics/asymptote/HEAD/doc/latexmkrc
sub asy {return system("asy -o '$_[0]' '$_[0]'");}
add_cus_dep("asy","eps",0,"asy");
add_cus_dep("asy","pdf",0,"asy");
add_cus_dep("asy","tex",0,"asy");