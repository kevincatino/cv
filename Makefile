SPANISH = spanish
ENGLISH =  english
TARGET = ./cv-X.pdf
SOURCE = ./cv.tex

all: build
	make clean

build: $(subst X, $(TARGET),$(SPANISH)) $(subst X, $(TARGET),$(ENGLISH))

$(subst X, $(TARGET),$(ENGLISH)): $(SOURCE)
	pdflatex -jobname=cv-$(ENGLISH) '\def\LANGUAGE{$(ENGLISH)} \input{$(SOURCE)}' $(SOURCE) 

$(subst X, $(TARGET),$(SPANISH)): $(SOURCE)
	pdflatex -jobname=cv-$(SPANISH) '\def\LANGUAGE{$(SPANISH)} \input{$(SOURCE)}' $(SOURCE) 

clean: 
	rm -rf *.aux *.log *.out *.fls *.gz *.fdb_latexmk cv.pdf