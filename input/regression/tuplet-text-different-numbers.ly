\version "2.19.21"
\header{
  texidoc="Non-standard tuplet texts: Printing other tuplet fractions than the ones actually assigned."
}
\layout { ragged-right= ##t }


\context Voice \relative {
  \once \override TupletNumber.text = #(tuplet-number::non-default-tuplet-denominator-text 7)
  \tuplet 3/2  { c''4. c4. c4. c4. }
  \once \override TupletNumber.text = #(tuplet-number::non-default-tuplet-fraction-text 12 7)
  \tuplet 3/2  { c4. c4. c4. c4. }
  \once \override TupletNumber.text = #(tuplet-number::append-note-wrapper (tuplet-number::non-default-tuplet-fraction-text 12 7) "8")
  \tuplet 3/2  { c4. c4. c4. c4. }
}
