%%  Do not edit this file; it is auto-generated from LSR!
\version "2.11.23"

\header { texidoc = "
Groups of beamed notes can be made by setting the subdivideBeams
property. However, if you have \"\time\"-statements inside your score,
you'll need to set the beatLength again after each \time-statement
(that has a denominator that is not 8).

This happens because the \"\time\"-statements reset the
beatLength-value to the denominator of the time signature.     So, if
you have many meter-changes, you can use the following function named
\"\timenb #X #Y\" instead of \"\time X/Y\".
" }

% timenb sets TIMEesignature and measure length, but Not Beatlength
timenb = #(define-music-function (parser location x y ) (integer? integer?) #{
	  \set Staff.timeSignatureFraction = #(cons $x $y)
	  \set Score.measureLength = #(ly:make-moment $x $y)
#})

\new Staff {
  \relative c''
  {
    \set Score.beatLength = #(ly:make-moment 1 8)
    \set subdivideBeams = ##t

    \timenb #3 #8 c16.[ c32 c16. c32 c16. c32] |
    \timenb #5 #8 d8[ d] d16.[ d32  d16. d32 d8] |
    \timenb #3 #4 e8[ e16. e32] e16.[ e32 e16. e32] e16.[ f32 f8] |
    \timenb #2 #4
    g16.[ g32 g16. g32] g16.[ g32 g16. g32] |
    
  }
}

