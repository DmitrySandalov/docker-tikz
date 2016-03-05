     docker build -t tikz .
     docker run -ti --rm --name tikz -v "$(pwd)":/usr/src/tex -w /usr/src/tex tikz pdflatex helloworld.tex
