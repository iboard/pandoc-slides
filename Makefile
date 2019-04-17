# CONFIGURATION
MAIN_FILE := pandoc-slides

## SETUP
INPUT_FILES := $(wildcard $(MAIN_FILE).md) assets/*
SLIDES_INDEX_FILE := "_slides/index.html"

## OUTPUT
SLIDES_INTERPRETER = slidy
TARGET = _slides/index.html $(MAIN_FILE).pdf
ASSETS_TARGET = _slides/slideous

# MAKE

all: $(TARGET)

help:
	@echo "---------------------------------------------------------------------------"
	@echo "                     MAKE THE SLIDES                                       "
	@echo "---------------------------------------------------------------------------"
	@echo " make [all] .... build $(TARGET)"
	@echo " make clean .... remove _slides/*"
	@echo " make open  .... open $(TARGET)"
	@echo "---------------------------------------------------------------------------"

open:
	@open _slides/index.html &
	@open $(MAIN_FILE).pdf

clean:
	@rm -rf _slides/*
	@rm -f $(MAIN_FILE).{pdf,aux,log,tex}
	@rm -f texput.log

$(MAIN_FILE).pdf: $(MAIN_FILE).md
	pandoc -t beamer $(MAIN_FILE).md -o $(MAIN_FILE).pdf

_slides/index.html: $(INPUT_FILES) Makefile
	pandoc -t $(SLIDES_INTERPRETER) \
		-s $(MAIN_FILE).md \
		-o $(SLIDES_INDEX_FILE)
	@test -d $(ASSETS_TARGET) || mkdir $(ASSETS_TARGET)
	@cp assets/* _slides/slideous/

