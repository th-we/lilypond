%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.12.2"

\header {
  lsrtags = "rhythms, tweaks-and-overrides"

  texidoc = "
Beam positions may be controlled manually, by overriding the
@code{positions} setting of the @code{Beam} grob.




"
  doctitle = "Manually controlling beam positions"
} % begin verbatim

\relative c' {
  \time 2/4
  % from upper staff-line (position 2) to center (position 0)
  \override Beam #'positions = #'(2 . 0)
  c8 c
  % from center to one above center (position 1)
  \override Beam #'positions = #'(0 . 1)
  c8 c
}


