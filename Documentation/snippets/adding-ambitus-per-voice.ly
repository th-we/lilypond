%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.12.2"

\header {
  lsrtags = "pitches, staff-notation, vocal-music"

%% Translation of GIT committish: fa19277d20f8ab0397c560eb0e7b814bd804ecec
  doctitlees = "Añadir un ámbito por voz"
  texidoces = "
Se puede añadir un ámbito por cada voz. En este caso, el ámbito se
debe desplazar manualmente para evitar colisiones.

"

%% Translation of GIT committish: 0a868be38a775ecb1ef935b079000cebbc64de40
texidocde = "
Ambitus können pro Stimme gesetzt werden. In diesem Fall müssen sie
manuell verschoben werden, um Zusammenstöße zu verhindern.

"
doctitlede = "Ambitus pro Stimme hinzufügen"

%% Translation of GIT committish: 58a29969da425eaf424946f4119e601545fb7a7e
  texidocfr = "
L'@code{ambitus} peut être individualisé par voix.  Il faut en pareil
cas éviter qu'ils se chevauchent.

"
  doctitlefr = "Un ambitus par voix"


  texidoc = "
Ambitus can be added per voice. In this case, the ambitus must be moved
manually to prevent collisions.

"
  doctitle = "Adding ambitus per voice"
} % begin verbatim

\new Staff <<
  \new Voice \with {
    \consists "Ambitus_engraver"
  } \relative c'' {
    \override Ambitus #'X-offset = #2.0
    \voiceOne
    c4 a d e
    f1
  }
  \new Voice \with {
    \consists "Ambitus_engraver"
  } \relative c' {
    \voiceTwo
    es4 f g as
    b1
  }
>>

