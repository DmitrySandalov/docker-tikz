FROM ubuntu:14.04

RUN apt-get update && \
    apt-get -y install wget

RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -O /tmp/install-tl-unx.tar.gz
RUN mkdir -p /tmp/tex
RUN tar -xzf /tmp/install-tl-unx.tar.gz --strip-components=1 -C /tmp/tex
RUN rm /tmp/install-tl-unx.tar.gz

ADD conf/texlive.profile /tmp/tex/texlive.profile
 
RUN /tmp/tex/install-tl --profile=/tmp/tex/texlive.profile
ENV PATH=/usr/local/texlive/bin/x86_64-linux:$PATH
RUN tlmgr update --self --all
RUN tlmgr install babel babel-english latex latex-bin latex-fonts latexconfig xetex standalone
RUN tlmgr install pgf ms graphics pdftex-def oberdiek xcolor

CMD ["pdflatex"]
