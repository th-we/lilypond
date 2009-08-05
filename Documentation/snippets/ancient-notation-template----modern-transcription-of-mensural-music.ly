%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.1"

\header {
  lsrtags = "ancient-notation, template"

%% Translation of GIT committish: b2d4318d6c53df8469dfa4da09b27c15a374d0ca
  texidoces = "
Al transcribir música mensural, es útil un «incipit» al compienzo
de la pieza para indicar la tonalidad y el tempo
originales. Aunque los músicos actuales están acostumbrados a las
barras de compás para reconocer con más facilidad los patrones
rítmicos, durante el período de la música mensural aún no se
habíen inventado las líneas divisorias; de hecho, la medida solía
cambiar a cada pocas notas. Como compromiso, a menudo las líneas
divisorias se imprimen entre los pentagramas en vez de hacerlo
encima de ellos.

"
  doctitlees = "Plantilla de notación de música antigua (transcripción moderna de música mensural)"
  
%% Translation of GIT committish: d96023d8792c8af202c7cb8508010c0d3648899d 
  texidocde = "
Bei der Transkription von Mensuralmusik ist es oft erwünscht, ein 
Incipit an den Anfang des Stückes zu stellen, damit klar ist, wie 
Tempo und Schlüssel in der Originalnotation gesetzt waren. Während 
heutzutage Musiker an Taktlinien gewöhnt sind, um Rhythmen schneller 
zu erkennen, wurden diese in der Mensuralmusik nicht verwendet. 
Tatsächlich ändern sich die Rhythmen auch oft alle paar Noten. Als 
ein Kompromiss werden die Notenlinien nicht auf dem System, sondern 
zwischen den Systemen geschrieben.
"

doctitlede = "Vorlage für Alte Notation -- moderne Transkription von Mensuralmusik"

%% Translation of GIT committish: 892286cbfdbe89420b8181975032ea975e79d2f5
  texidocfr = "
Lorsque l'on transcrit de la musique mensurale, un @emph{incipit} permet
d'indiquer la tonalité et le tempo d'origine.  Si les musiciens sont de
nos jours habitués aux barres de mesures qui présentent la structure
rythmique d'une œuvre, elles n'étaient pas en vigueur à l'époque où ces
pièces ont été composées, d'autant plus que la @qq{métrique} pouvait
changer au fil des notes.  Un compromis consiste à imprimer des barres
entre les portées plutôt que sur chacune d'elles.

"
  doctitlefr = "Exemples de notation ancienne -- transcription moderne de musique mensurale"

  doctitle = "Exemples de notation ancienne -- transcription moderne de musique mensurale"

  texidoc = "
When transcribing mensural music, an incipit at the beginning of the
piece is useful to indicate the original key and tempo. While today
musicians are used to bar lines in order to faster recognize rhythmic
patterns, bar lines were not yet invented during the period of mensural
music; in fact, the meter often changed after every few notes. As a
compromise, bar lines are often printed between the staves rather than
on the staves. 

"
  doctitle = "Ancient notation template -- modern transcription of mensural music"
} % begin verbatim

global = {
  \set Score.skipBars = ##t

  % incipit
  \once \override Score.SystemStartBracket #'transparent = ##t
  \override Score.SpacingSpanner #'spacing-increment = #1.0 % tight spacing
  \key f \major
  \time 2/2
  \once \override Staff.TimeSignature #'style = #'neomensural
  \override Voice.NoteHead #'style = #'neomensural
  \override Voice.Rest #'style = #'neomensural
  \set Staff.printKeyCancellation = ##f
  \cadenzaOn % turn off bar lines
  \skip 1*10
  \once \override Staff.BarLine #'transparent = ##f
  \bar "||"
  \skip 1*1 % need this extra \skip such that clef change comes
            % after bar line
  \bar ""

  % main
  \revert Score.SpacingSpanner #'spacing-increment % CHECK: no effect?
  \cadenzaOff % turn bar lines on again
  \once \override Staff.Clef #'full-size-change = ##t
  \set Staff.forceClef = ##t
  \key g \major
  \time 4/4
  \override Voice.NoteHead #'style = #'default
  \override Voice.Rest #'style = #'default

  % FIXME: setting printKeyCancellation back to #t must not
  % occur in the first bar after the incipit.  Dto. for forceClef.
  % Therefore, we need an extra \skip.
  \skip 1*1
  \set Staff.printKeyCancellation = ##t
  \set Staff.forceClef = ##f

  \skip 1*7 % the actual music

  % let finis bar go through all staves
  \override Staff.BarLine #'transparent = ##f

  % finis bar
  \bar "|."
}

discantusNotes = {
  \transpose c' c'' {
    \set Staff.instrumentName = #"Discantus  "

    % incipit
    \clef "neomensural-c1"
    c'1. s2   % two bars
    \skip 1*8 % eight bars
    \skip 1*1 % one bar

    % main
    \clef "treble"
    d'2. d'4 |
    b e' d'2 |
    c'4 e'4.( d'8 c' b |
    a4) b a2 |
    b4.( c'8 d'4) c'4 |
    \once \override NoteHead #'transparent = ##t c'1 |
    b\breve |
  }
}

discantusLyrics = \lyricmode {
  % incipit
  IV-

  % main
  Ju -- bi -- |
  la -- te De -- |
  o, om --
  nis ter -- |
  ra, __ om- |
  "..." |
  -us. |
}

altusNotes = {
  \transpose c' c'' {
    \set Staff.instrumentName = #"Altus  "

    % incipit
    \clef "neomensural-c3"
    r1        % one bar
    f1. s2    % two bars
    \skip 1*7 % seven bars
    \skip 1*1 % one bar

    % main
    \clef "treble"
    r2 g2. e4 fis g | % two bars
    a2 g4 e |
    fis g4.( fis16 e fis4) |
    g1 |
    \once \override NoteHead #'transparent = ##t g1 |
    g\breve |
  }
}

altusLyrics = \lyricmode {
  % incipit
  IV-

  % main
  Ju -- bi -- la -- te | % two bars
  De -- o, om -- |
  nis ter -- ra, |
  "..." |
  -us. |
}

tenorNotes = {
  \transpose c' c' {
    \set Staff.instrumentName = #"Tenor  "

    % incipit
    \clef "neomensural-c4"
    r\longa   % four bars
    r\breve   % two bars
    r1        % one bar
    c'1. s2   % two bars
    \skip 1*1 % one bar
    \skip 1*1 % one bar

    % main
    \clef "treble_8"
    R1 |
    R1 |
    R1 |
    r2 d'2. d'4 b e' | % two bars
    \once \override NoteHead #'transparent = ##t e'1 |
    d'\breve |
  }
}

tenorLyrics = \lyricmode {
  % incipit
  IV-

  % main
  Ju -- bi -- la -- te | % two bars
  "..." |
  -us. |
}

bassusNotes = {
  \transpose c' c' {
    \set Staff.instrumentName = #"Bassus  "

    % incipit
    \clef "bass"
    r\maxima  % eight bars
    f1. s2    % two bars
    \skip 1*1 % one bar

    % main
    \clef "bass"
    R1 |
    R1 |
    R1 |
    R1 |
    g2. e4 |
    \once \override NoteHead #'transparent = ##t e1 |
    g\breve |
  }
}

bassusLyrics = \lyricmode {
  % incipit
  IV-

  % main
  Ju -- bi- |
  "..." |
  -us. |
}

\score {
  \new StaffGroup = choirStaff <<
    \new Voice =
      "discantusNotes" << \global \discantusNotes >>
    \new Lyrics =
      "discantusLyrics" \lyricsto discantusNotes { \discantusLyrics }
    \new Voice =
      "altusNotes" << \global \altusNotes >>
    \new Lyrics =
      "altusLyrics" \lyricsto altusNotes { \altusLyrics }
    \new Voice =
      "tenorNotes" << \global \tenorNotes >>
    \new Lyrics =
      "tenorLyrics" \lyricsto tenorNotes { \tenorLyrics }
    \new Voice =
      "bassusNotes" << \global \bassusNotes >>
    \new Lyrics =
      "bassusLyrics" \lyricsto bassusNotes { \bassusLyrics }
  >>
  \layout {
    \context {
      \Score

      % no bars in staves
      \override BarLine #'transparent = ##t

      % incipit should not start with a start delimiter
      \remove "System_start_delimiter_engraver"
    }
    \context {
      \Voice

      % no slurs
      \override Slur #'transparent = ##t

      % Comment in the below "\remove" command to allow line
      % breaking also at those barlines where a note overlaps
      % into the next bar.  The command is commented out in this
      % short example score, but especially for large scores, you
      % will typically yield better line breaking and thus improve
      % overall spacing if you comment in the following command.
      %\remove "Forbid_line_break_engraver"
    }
  }
}



