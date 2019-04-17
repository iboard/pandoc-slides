# Pandoc To Slides And PDF

This is a template for your slides written in markdown and presented
in HTML and PDF to convert using [Pandoc][] and a simple `Makefile`.

## Usage

+ Clone the repo from Github.
+ Optional: rename the file `pandoc-slides.md` to `your_title.md`.
+ Edit the top configuration in `Makefile`.
  - Make sure the MAIN_FILE is set to whatever `your_title` is.
+ Edit `your_title.md` and write your presentation.
+ call `make`
+ `open _slides/index.html` will open the slides in your browser.
+ `open your_title.pdf` will open the slides as a PDF-file

[Pandoc]: https://pandoc.org/

