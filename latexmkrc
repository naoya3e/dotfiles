#!/usr/bin/env perl

$latex        = 'platex -shell-escape -halt-on-error';
$latex_silent = 'platex -shell-escape -halt-on-error -interaction=batchmode';
$bibtex       = 'pbibtex';
$dvipdf       = 'dvipdfmx %O -o %D %S';
$makeindex    = 'mendex %O -o %D %S';
$max_repeat   = 5
$pdf_mode     = 3

$pvc_view_file_via_temporary = 0;

$pdf_update_command = 'open -ga Preview %S';
