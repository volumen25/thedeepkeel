\version "2.24.0"
#(set-global-staff-size 20)
#(set-default-paper-size "letter")

\header {
  title = "White Christmas"
  subtitle = "Chord Chart"
  composer = "Irving Berlin"
  tagline = ##f
}

\paper {
  top-margin = 10\mm
  bottom-margin = 10\mm
  left-margin = 14\mm
  right-margin = 14\mm
  indent = 0
  ragged-last-bottom = ##t
}

% ---------------------------------------------------------------
% Jazz-style chord symbols
% ---------------------------------------------------------------
chExceptionMusic = {
  <c e g b>1-\markup { \hspace #0.2 \fontsize #-1 "∆7" }
  <c e g b d' a'>1-\markup { \hspace #0.2 \fontsize #-1 "∆13" }
  <c e g bes d' a'>1-\markup { \super "13" }
  <c ees ges beses>1-\markup { \super "°7" }
  <c f g bes d'>1-\markup { \super "9sus4" }
  <c e g a d'>1-\markup { \super "6/9" }
}
chExceptions = #(append
  (sequential-music-to-chord-exceptions chExceptionMusic #t)
  ignatzekExceptions)

% ---------------------------------------------------------------
% My fingerings (strings 6 to 1, x = muted)
% ---------------------------------------------------------------
\storePredefinedDiagram #default-fret-table \chordmode { c:maj7 }   #guitar-tuning "x;3;5;4;5;x;"
\storePredefinedDiagram #default-fret-table \chordmode { d:m7 }     #guitar-tuning "x;5;3;5;6;x;"
\storePredefinedDiagram #default-fret-table \chordmode { fis:13 }   #guitar-tuning "2;x;2;3;4;x;"
\storePredefinedDiagram #default-fret-table \chordmode { dis:dim7 } #guitar-tuning "x;6;7;5;7;x;"
\storePredefinedDiagram #default-fret-table \chordmode { e:m7 }     #guitar-tuning "x;7;5;7;8;x;"
\storePredefinedDiagram #default-fret-table \chordmode { f:maj7 }   #guitar-tuning "x;8;10;9;10;x;"
\storePredefinedDiagram #default-fret-table \chordmode { g:9 }      #guitar-tuning "x;10;9;10;10;x;"
\storePredefinedDiagram #default-fret-table \chordmode { ees:7 }    #guitar-tuning "x;x;1;3;2;3;"
\storePredefinedDiagram #default-fret-table \chordmode { d:m11 }    #guitar-tuning "x;x;0;2;1;3;"
\storePredefinedDiagram #default-fret-table \chordmode { g:9sus4 }  #guitar-tuning "3;x;3;2;1;x;"
\storePredefinedDiagram #default-fret-table \chordmode { c:7 }      #guitar-tuning "x;3;5;3;5;x;"
\storePredefinedDiagram #default-fret-table \chordmode { f:6.9 }    #guitar-tuning "1;x;0;0;1;x;"
\storePredefinedDiagram #default-fret-table \chordmode { f:m6 }     #guitar-tuning "1;x;0;1;1;x;"
\storePredefinedDiagram #default-fret-table \chordmode { g:7 }      #guitar-tuning "3;x;3;4;3;x;"
\storePredefinedDiagram #default-fret-table \chordmode { bes:7 }    #guitar-tuning "6;x;6;7;x;x;"
\storePredefinedDiagram #default-fret-table \chordmode { bes:9 }    #guitar-tuning "6;x;6;5;x;x;"
\storePredefinedDiagram #default-fret-table \chordmode { cis:dim7 } #guitar-tuning "x;4;5;3;5;x;"
\storePredefinedDiagram #default-fret-table \chordmode { aes:dim7 } #guitar-tuning "4;x;3;4;x;x;"
\storePredefinedDiagram #default-fret-table \chordmode { des:maj13 } #guitar-tuning "x;4;3;3;1;x;"
\storePredefinedDiagram #default-fret-table \chordmode { c:6 }      #guitar-tuning "x;3;2;2;1;x;"

% ---------------------------------------------------------------
% Harmony by phrase (4/4). Beat splits are assumed; edit if your chart differs.
% ---------------------------------------------------------------
harmOne = \chordmode {
  c2:maj7 d4:m7 fis4:13 |
  d2:m7 dis4:dim7 e4:m7 |
}
harmTwo = \chordmode {
  f2:maj7 g2:9 |
  c4:maj7 ees4:7 d4:m11 g8:9sus4 g8:9 |
  c2:maj7 c2:7 |
}
harmThree = \chordmode {
  f2:6.9 f2:m6 |
  c2:maj7 d4:m7 g4:9 |
  d2:m7 g2:7 |
}
harmFour = \chordmode {
  f2:maj7 bes4:7 bes4:9 |
  c4:maj7 cis4:dim7 f4:maj7 aes4:dim7 |
  des2:maj13 c2:6 |
}

% Fret diagrams. Where one chord needs a different shape (second G9, second
% Dm7, other Fmaj7 shapes) the notes are entered with string numbers.
fretOne = \harmOne
fretTwo = {
  \chordmode { f2:maj7 g2:9 | c4:maj7 ees4:7 d4:m11 g8:9sus4 }
  <b,\5 f\4 a\3 d'\2>8 |
  \chordmode { c2:maj7 c2:7 | }
}
fretThree = {
  \chordmode { f2:6.9 f2:m6 | c2:maj7 d4:m7 }
  <b,\5 f\4 a\3 d'\2>4 |
  <d\5 f\4 c'\3 d'\2>2
  \chordmode { g2:7 | }
}
fretFour = {
  <f\5 c'\4 e'\3 a'\2 c''\1>2
  \chordmode { bes4:7 bes4:9 | c4:maj7 cis4:dim7 }
  <f\5 a\4 c'\3 e'\2 a'\1>4
  \chordmode { aes4:dim7 | des2:maj13 c2:6 | }
}

% ---------------------------------------------------------------
% Page 1: the form at a glance (chord symbols over slashes)
% ---------------------------------------------------------------
formA = { \harmOne \harmTwo \harmThree }
formB = { \harmOne \harmTwo \harmFour }

slashA = {
  b2 ^\markup \bold \fontsize #-1 "Phrase 1" b4 b | b2 b4 b |
  b2 ^\markup \bold \fontsize #-1 "Phrase 2" b | b4 b b b8 b | \break
  b2 b |
  b2 ^\markup \bold \fontsize #-1 "Phrase 3" b | b2 b4 b | b2 b | \break
}
slashB = {
  b2 ^\markup \bold \fontsize #-1 "Phrase 1" b4 b | b2 b4 b |
  b2 ^\markup \bold \fontsize #-1 "Phrase 2" b | b4 b b b8 b | \break
  b2 b |
  b2 ^\markup \bold \fontsize #-1 "Phrase 4" b4 b | b4 b b b | b2 b | \break
}

formLayout = \layout {
  \context {
    \Score
    \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/4)
    barNumberVisibility = #all-bar-numbers-visible
    \override BarNumber.break-visibility = #end-of-line-invisible
    \override BarNumber.extra-offset = #'(1.1 . -4.2)
    \override BarNumber.font-size = #0
    \override BarNumber.font-series = #'bold
  }
}

\bookpart {
  \score {
    \header { piece = \markup { \bold \fontsize #2 "A1  (Phrase 1 - Phrase 2 - Phrase 3)" } }
    <<
      \new ChordNames \with {
        chordNameExceptions = #chExceptions
        \override ChordName.font-size = #2
      } { \formA }
      \new Staff \with {
        \remove Clef_engraver
        \remove Time_signature_engraver
        \override StaffSymbol.line-count = 1
      } { \improvisationOn \bar "" \slashA }
    >>
    \formLayout
  }
  \score {
    \header { piece = \markup { \bold \fontsize #2 "A2  (Phrase 1 - Phrase 2 - Phrase 4)" } }
    <<
      \new ChordNames \with {
        chordNameExceptions = #chExceptions
        \override ChordName.font-size = #2
      } { \formB }
      \new Staff \with {
        \remove Clef_engraver
        \remove Time_signature_engraver
        \override StaffSymbol.line-count = 1
      } { \improvisationOn \bar "" \slashB }
    >>
    \formLayout
  }
  \markup \vspace #1
  \markup \fontsize #-1 {
    \column {
      \line { "Form: A1, then A2 (the two halves share Phrases 1 and 2; only the last three bars differ)." }
    }
  }
}

% ---------------------------------------------------------------
% Page 2: Chords by phrase (each phrase once)
% ---------------------------------------------------------------
gripsLayout = \layout {
  \context {
    \Score
    \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
    \override SpacingSpanner.shortest-duration-space = #6
    \omit BarNumber
  }
}

\bookpart {
  \header { subtitle = "Chords by Phrase" }
  \score {
    \header { piece = \markup { \bold \fontsize #2 "Phrase 1  (bars 1-2)" } }
    <<
      \new ChordNames \with { chordNameExceptions = #chExceptions \override ChordName.font-size = #2 } { \harmOne }
      \new FretBoards \with { \override FretBoard.size = #1.4 } { \fretOne }
      \new Staff \with { \remove Clef_engraver \remove Time_signature_engraver \override StaffSymbol.line-count = 1 }
        { \hideNotes r2 r4 r4 | r2 r4 r4 | }
    >>
    \gripsLayout
  }
  \score {
    \header { piece = \markup { \bold \fontsize #2 "Phrase 2  (bars 3-5)" } }
    <<
      \new ChordNames \with { chordNameExceptions = #chExceptions \override ChordName.font-size = #2 } { \harmTwo }
      \new FretBoards \with { \override FretBoard.size = #1.4 } { \fretTwo }
      \new Staff \with { \remove Clef_engraver \remove Time_signature_engraver \override StaffSymbol.line-count = 1 }
        { \set Score.currentBarNumber = #3 \hideNotes r2 r2 | r4 r4 r4 r8 r8 | r2 r2 | }
    >>
    \gripsLayout
  }
  \score {
    \header { piece = \markup { \bold \fontsize #2 "Phrase 3  (bars 6-8, A1 ending)" } }
    <<
      \new ChordNames \with { chordNameExceptions = #chExceptions \override ChordName.font-size = #2 } { \harmThree }
      \new FretBoards \with { \override FretBoard.size = #1.4 } { \fretThree }
      \new Staff \with { \remove Clef_engraver \remove Time_signature_engraver \override StaffSymbol.line-count = 1 }
        { \set Score.currentBarNumber = #6 \hideNotes r2 r2 | r2 r4 r4 | r2 r2 | }
    >>
    \gripsLayout
  }
  \score {
    \header { piece = \markup { \bold \fontsize #2 "Phrase 4  (bars 6-8, A2 ending)" } }
    <<
      \new ChordNames \with { chordNameExceptions = #chExceptions \override ChordName.font-size = #2 } { \harmFour }
      \new FretBoards \with { \override FretBoard.size = #1.4 } { \fretFour }
      \new Staff \with { \remove Clef_engraver \remove Time_signature_engraver \override StaffSymbol.line-count = 1 }
        { \set Score.currentBarNumber = #6 \hideNotes r2 r4 r4 | r4 r4 r4 r4 | r2 r2 | }
    >>
    \gripsLayout
  }
  \markup \vspace #0.5
  \markup \fontsize #-1 { "Diagrams show strings 6 (left) to 1 (right); x = muted string, numbers at the side = starting fret." }
}
