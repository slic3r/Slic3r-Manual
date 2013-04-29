#!/bin/sh

set -x
clear
#makeindex -s Manual.gst -o Manual.gls Manual.glo && \
#makeindex -s Manual.ist Manual.idx && \
rm -f Manual.pdf && \
pdflatex  -halt-on-error Manual.tex && \
#evince Manual.pdf
#exit 0
makeindex -s Manual.gst -o Manual.gls Manual.glo && \
makeindex -s Manual.ist Manual.idx && \
pdflatex  -halt-on-error Manual.tex && \
makeindex -s Manual.gst -o Manual.gls Manual.glo && \
makeindex -s Manual.ist Manual.idx && \
pdflatex  -halt-on-error Manual.tex && \
pdflatex  -halt-on-error Manual.tex && \
pdflatex  -halt-on-error Manual-thumbs.tex
evince Manual.pdf 

