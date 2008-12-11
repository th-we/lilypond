%% Do not edit this file; it is auto-generated from input/new
%% This file is in the public domain.
\version "2.11.64"
\header {
  texidoces = "
Los pasajes citados tienen en cuenta la transposición de la fuente
tanto como la del destino.  En este ejemplo, todos los
instrumentos interpreta una nota con el sonido del Do central; el
destino de un instrumento transpositor en Fa.  La parte de destino
se puede transponer utilizando @code{\\transpose}.  En este caso
se transportan todas las notas (incluidas las citadas).

"

doctitlees = "Citar otra voz con transposición"
  lsrtags = "pitches,staff-notation"
  texidoc = "Quotations take into account the transposition of both
source and target.  In this example, all instruments play sounding
middle C; the target is an instrument in F.  The target part may be
transposed using @code{\\transpose}.  In this case, all the pitches
(including the quoted ones) are transposed.
"
  doctitle = "Quoting another voice with transposition"
} % begin verbatim


\addQuote clarinet {
  \transposition bes
  \repeat unfold 8 { d'16 d' d'8 }
}

\addQuote sax {
  \transposition es'
  \repeat unfold 16 { a8 }
}

quoteTest = {
  % french horn
  \transposition f
  g'4
  << \quoteDuring #"clarinet" { \skip 4 } s4^"clar." >>
  << \quoteDuring #"sax" { \skip 4 } s4^"sax." >>
  g'4
}

{
  \set Staff.instrumentName =
    \markup {
      \center-column { Horn \line { in F } }
    }
  \quoteTest
  \transpose c' d' << \quoteTest s4_"up a tone" >>
}
