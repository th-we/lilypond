%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.12.2"

\header {
  lsrtags = "expressive-marks, editorial-annotations"

%% Translation of GIT committish: fa19277d20f8ab0397c560eb0e7b814bd804ecec
  texidoces = "
Se puede cambiar el aspecto de las ligaduras de expresión de
continuas a punteadas o intermitentes.

"
  doctitlees = "Modificar el aspecto continuo de una ligadura de expresión a punteado o intermitente"

  texidoc = "
The appearance of slurs may be changed from solid to dotted or dashed.

"
  doctitle = "Changing the appearance of a slur from solid to dotted or dashed"
} % begin verbatim

\relative c' {
  c4( d e c)
  \slurDotted
  c4( d e c)
  \slurSolid
  c4( d e c)
  \slurDashed
  c4( d e c)
  \slurSolid
  c4( d e c)
}


