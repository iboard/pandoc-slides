---
title: Slides With Pandoc, A Template
author: Andi Altendorfer
date: April 2019
theme: Pittsburgh
font: serif
output:
  slidy_presentation:
    font_adjustment: +1
    duration: 45
    footer: (c) 2019 by Andreas Altendorfer
---
# Andreas Altendorfer

<center>
![A father of two, a motorcyclist, a craftsman, a nice guy](https://s.gravatar.com/avatar/2bc8aae4d0c8077d77b4f708b76718ee?s=80)
<br/>
<hr>
<br/>

### **@Nickendell** on [Twitter](https://twitter.com/Nickendell)
### **iboard** on [Github](https://github.com/iboard)
### **iboard.cc**@gmail.com

</center>

# Agenda

+ Prerequisites
+ Pandoc, LaTeX, and Beamer
+ Good old `Makefile`
+ Usage

# Prerequisites

There are some prerequisites to be installed first if you haven't already.

These are:

+ Markdown
+ LaTeX
+ Beamer
+ Pandoc

# Install pandoc and LaTeX on a Mac

Assuming you're using [Homebrew][] on your Mac, install the following packages
with `brew`:

```bash
  brew cask install pdflatex
  brew cask install mactex
  brew install pandoc
```

## Other Environments

If you're working on Linux or other OS, the internet will be your friend
finding how to install those packages on your target machine.

# Pandoc

[Pandoc][] is a **Universal document converter** which we use to convert 

1. from *Markdown* to Slides
2. from *Markdown* to PDF using *Beamer*

# Convert to Slides

Using `pandoc` to convert the markdown file to an `index.html`.

```bash
  mkdir _slides
  pandoc -t slidy \
         -s slides.md \
         -o _slides/index.html
```

Now you can open the slides with `open _slides/index.html`

# Makefile (Part 1)

## Some configuration and definitions first ...

```Makefile
  # CONFIGURATION
  MAIN_FILE := pandoc-slides

  ## SETUP
  INPUT_FILES := $(wildcard $(MAIN_FILE).md) assets/*
  SLIDES_INDEX_FILE := "_slides/index.html"

  ## OUTPUT
  SLIDES_INTERPRETER = slidy
  TARGET = _slides/index.html $(MAIN_FILE).pdf
  ASSETS_TARGET = _slides/slideous
```

# Makefile (Part 2)

Part two of the Makefile defines the global targets, which are 
`all` and `clean`.

## Global Make Targets

```Makefile
  all: $(TARGET)

  clean:
    @echo "REMOVE _slides/*"
    @rm -rvf _slides/*
    @rm -f $(MAIN_FILE).{pdf,aux,log,tex}
    @rm -f texput.log
```

# Makefile (Part 3 - Build PDF and Slides)

## Build The PDF

```Makefile
  $(MAIN_FILE).pdf: $(MAIN_FILE).md
    pandoc -t beamer $(MAIN_FILE).md -o $(MAIN_FILE).pdf
    @echo "Done. Now you can .... open $(MAIN_FILE).pdf"
```

## Build The Slides

```Makefile
  _slides/index.html: $(INPUT_FILES) Makefile
    pandoc -t $(SLIDES_INTERPRETER) \
           -s $(MAIN_FILE).md \
           -o $(SLIDES_INDEX_FILE)
    @test -d $(ASSETS_TARGET) || mkdir $(ASSETS_TARGET)
    @cp assets/* _slides/slideous/
    @echo "Done. open _slides/index.html"
```

# Convert to OpenSlides or PPT

Search the internet for different options to convert *Beamer* and *LaTeX* 
to other formats.

# How You Can Use This

+ Clone the repo from Github.
+ Optional: rename the file `pandoc-slides.md` to `your_title.md`.
+ Edit the top configuration in `Makefile`.
  - Make sure the MAIN_FILE is set to whatever `your_title` is.
+ Edit `your_title.md` and write your presentation.
+ call `make`
+ `open _slides/index.html` will open the slides in your browser.
+ `open your_title.pdf` will open the slides as a PDF-file

# Recap

...TBW...

# Thank You!

<center>
## Andreas Altendorfer, 
### Slides With Pandoc, A Template
![**Andreas Altendorfer**](https://s.gravatar.com/avatar/2bc8aae4d0c8077d77b4f708b76718ee?s=80)
<br/>

**@Nickendell** on [Twitter](https://twitter.com/Nickendell)

**iboard** on [Github](https://github.com/iboard)

**iboard.cci**@gmail.com
</center>

[Pandoc]: https://pandoc.org/
[Homebrew]: https://brew.sh/
