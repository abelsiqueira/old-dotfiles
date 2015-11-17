$pdflatex='pdflatex --shell-escape --enable-write18 -interaction nonstopmode %O %S';
$pdf_previewer='start evince %O %S';
$pdf_mode = 1;
$postscript_mode = 0;
$dvi_mode = 0;
$auxdir = "tmp-files";
$use_make_for_missing_files = 1;
