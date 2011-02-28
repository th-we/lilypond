%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.12.2"

\header {
  lsrtags = "pitches, staff-notation, vocal-music, template"

%% Translation of GIT committish: fa19277d20f8ab0397c560eb0e7b814bd804ecec
  texidoces = "
Esta plantilla muestra el uso de contextos @code{StaffGroup} y
@code{GrandStaff} anidados para sub-agrupar instrumentos del mismo
tipo, y una forma de usar @code{\\transpose} de manera que unas
variables contengan la música para instrumentos transpositores en
afinación de concierto.

"
  doctitlees = "Plantilla de orquesta con coro y piano"

%% Translation of GIT committish: 64feeff58e5ce3397de87188a08ac99f7ef8e37b

  texidocde = "
Diese Vorlage zeigt die Benutzung von geschachtelten
@code{StaffGroup}- und @code{GrandStaff}-Kontexte, um
Instrumente in Untergruppen zu unterteilen, und die
Benutzung von @code{\\transpose} für transponierende
Instrumente.  Alle Noten werden in C geschrieben.  Noten
können in C eingegeben werden, oder auch in der Tonart
des Instrumentes: dann müssen sie zuerst nach C transponiert
werden, bevor sie einer Variable zugewiesen werden.

"
  doctitlede = "Orchester Chor und Klavier"

%% Translation of GIT committish: bdfe3dc8175a2d7e9ea0800b5b04cfb68fe58a7a
  texidocfr = "
Ce canevas illustre l'utilisation de contextes @code{StaffGroup} pour
regrouper les instruments selon leur famille, imbriqués dans un
@code{GrandStaff}, ainsi que le recours à la fonction @code{\\transpose}
pour les instruments transpositeurs.  Dans tous les identificateurs, la
musique est stockée en ut.  Les notes peuvent tout aussi bien être
saisies en ut ou dans la tonalité particulière de l'instrument avant
d'être transposées puis affectées à une variable.

"
  doctitlefr = "Orchestre chœur et piano"

  texidoc = "
This template demonstrates the use of nested @code{StaffGroup} and
@code{GrandStaff} contexts to sub-group instruments of the same type
together, and a way to use @code{\\transpose} so that variables hold
music for transposing instruments at concert pitch.

"
  doctitle = "Orchestra choir and piano template"
} % begin verbatim

#(set-global-staff-size 17)
\paper {
  indent = 3.0\cm  % space for instrumentName
  short-indent = 1.5\cm  % space for shortInstrumentName
}

fluteMusic = \relative c' { \key g \major g'1 b }
% Pitches as written on a manuscript for Clarinet in A
% are transposed to concert pitch.
clarinetMusic = \transpose c' a
  \relative c'' { \key bes \major bes1 d }
trumpetMusic = \relative c { \key g \major g''1 b }
% Key signature is often omitted for horns
hornMusic = \transpose c' f
  \relative c { d'1 fis }
percussionMusic = \relative c { \key g \major g1 b }
sopranoMusic = \relative c'' { \key g \major g'1 b }
sopranoLyrics = \lyricmode { Lyr -- ics }
altoIMusic = \relative c' { \key g \major g'1 b }
altoIIMusic = \relative c' { \key g \major g'1 b }
altoILyrics =  \sopranoLyrics
altoIILyrics = \lyricmode { Ah -- ah }
tenorMusic = \relative c' { \clef "treble_8" \key g \major g1 b }
tenorLyrics = \sopranoLyrics
pianoRHMusic = \relative c { \key g \major g''1 b }
pianoLHMusic = \relative c { \clef bass \key g \major g1 b }
violinIMusic = \relative c' { \key g \major g'1 b }
violinIIMusic = \relative c' { \key g \major g'1 b }
violaMusic = \relative c { \clef alto \key g \major g'1 b }
celloMusic = \relative c { \clef bass \key g \major g1 b }
bassMusic = \relative c { \clef "bass_8" \key g \major g,1 b }

\score {
  <<
    \new StaffGroup = "StaffGroup_woodwinds" <<
      \new Staff = "Staff_flute" {
        \set Staff.instrumentName = #"Flute"
        % shortInstrumentName, midiInstrument, etc.
        % may be set here as well
        \fluteMusic
      }
      \new Staff = "Staff_clarinet" {
        \set Staff.instrumentName =
        \markup { \concat { "Clarinet in B" \flat } }
        % Declare that written Middle C in the music
        %  to follow sounds a concert B flat, for
        %  output using sounded pitches such as MIDI.
        \transposition bes
        % Print music for a B-flat clarinet
        \transpose bes c' \clarinetMusic
      }
    >>
    \new StaffGroup = "StaffGroup_brass" <<
      \new Staff = "Staff_hornI" {
        \set Staff.instrumentName = #"Horn in F"
        \transposition f
        \transpose f c' \hornMusic
      }
      \new Staff = "Staff_trumpet" {
        \set Staff.instrumentName = #"Trumpet in  C"
        \trumpetMusic
      }
    >>
    \new RhythmicStaff = "RhythmicStaff_percussion" <<
      \set RhythmicStaff.instrumentName = #"Percussion"
      \percussionMusic
    >>
    \new PianoStaff <<
      \set PianoStaff.instrumentName = #"Piano"
      \new Staff { \pianoRHMusic }
      \new Staff { \pianoLHMusic }
    >>
    \new ChoirStaff = "ChoirStaff_choir" <<
      \new Staff = "Staff_soprano" {
        \set Staff.instrumentName = #"Soprano"
        \new Voice = "soprano"
        \sopranoMusic
      }
      \new Lyrics \lyricsto "soprano" { \sopranoLyrics }
      \new GrandStaff = "GrandStaff_altos"
      \with { \accepts Lyrics } <<
        \new Staff = "Staff_altoI"  {
          \set Staff.instrumentName = #"Alto I"
          \new Voice = "altoI"
          \altoIMusic
        }
        \new Lyrics \lyricsto "altoI" { \altoILyrics }
        \new Staff = "Staff_altoII" {
          \set Staff.instrumentName = #"Alto II"
          \new Voice = "altoII"
          \altoIIMusic
        }
        \new Lyrics \lyricsto "altoII" { \altoIILyrics }
      >>
      \new Staff = "Staff_tenor" {
        \set Staff.instrumentName = #"Tenor"
        \new Voice = "tenor"
        \tenorMusic
      }
      \new Lyrics \lyricsto "tenor" { \tenorLyrics }
    >>
    \new StaffGroup = "StaffGroup_strings" <<
      \new GrandStaff = "GrandStaff_violins" <<
        \new Staff = "Staff_violinI" {
          \set Staff.instrumentName = #"Violin I"
          \violinIMusic
        }
        \new Staff = "Staff_violinII" {
          \set Staff.instrumentName = #"Violin II"
          \violinIIMusic
        }
      >>
      \new Staff = "Staff_viola" {
        \set Staff.instrumentName = #"Viola"
        \violaMusic
      }
      \new Staff = "Staff_cello" {
        \set Staff.instrumentName = #"Cello"
        \celloMusic
      }
      \new Staff = "Staff_bass" {
        \set Staff.instrumentName = #"Double Bass"
        \bassMusic
      }
    >>
  >>
  \layout { }
}

