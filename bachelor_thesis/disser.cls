%%
%% This is file `disser.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% disser.dtx  (with options: `disser')
%% counters.dtx  (with options: `counters')
%% part.dtx  (with options: `part')
%% chapter.dtx  (with options: `chapter')
%% sections.dtx  (with options: `sections')
%% lists.dtx  (with options: `lists')
%% floats.dtx  (with options: `floats')
%% footnote.dtx  (with options: `footnote')
%% env.dtx  (with options: `env')
%% page.dtx  (with options: `page')
%% titlepage.dtx  (with options: `titlepage')
%% toc.dtx  (with options: `toc')
%% custom.dtx  (with options: `custom')
%% 
%% Copyright (c) 2004-2014 Stanislav Kruchinin.
%% All rights reserved.
%% 
%% This file is part of the disser package.
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% disser -- LaTeX document class for dissertations.
%%
%% Copyright (c) Stanislav Kruchinin
%%
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2003/12/01 or later.
%%
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{disser}[2015/07/25 1.3.2 %
  Document class for dissertations]

\RequirePackage{kvoptions}

\RequirePackage{ifpdf}

\RequirePackage{ifthen}

\newif\if@titlepage@en\@titlepage@enfalse
\newif\if@restonecol
\newif\if@titlepage\@titlepagetrue
\newif\if@openright\@openrightfalse
\newif\ifDis@bachelor\Dis@bachelorfalse
\newif\ifDis@specialist\Dis@specialistfalse
\newif\ifDis@master\Dis@masterfalse
\newif\ifDis@candidate\Dis@candidatetrue
\newif\ifDis@doctor\Dis@doctorfalse
\newif\ifDis@autoref\Dis@autoreffalse
\newif\ifDis@libcat\Dis@libcatfalse
\newif\ifDis@classified\Dis@classifiedfalse
\newif\ifDis@facsimile\Dis@facsimilefalse
\newif\ifDis@ams\Dis@amstrue
\newif\ifDis@href\Dis@hreffalse
\newif\ifDis@subf\Dis@subffalse
\newif\ifDis@times\Dis@timesfalse
\newif\ifDis@mtpro\Dis@mtprofalse
\newif\ifDis@natbib\Dis@natbibfalse
\DeclareOption{href}{\Dis@hreftrue}
\DeclareOption{subf}{\Dis@subftrue}
\DeclareOption{libcat}{\Dis@libcattrue}
\DeclareOption{classified}{\Dis@classifiedtrue}
\DeclareOption{facsimile}{\Dis@facsimiletrue}
\DeclareOption{noams}{\Dis@amsfalse}
\DeclareOption{natbib}{\Dis@natbibtrue}
\DeclareOption{a4paper}{%
  \setlength\paperheight{297mm}
  \setlength\paperwidth {210mm}
}
\DeclareOption{a5paper}{%
  \setlength\paperheight{210mm}
  \setlength\paperwidth {148mm}
}
\DeclareOption{b5paper}{%
  \setlength\paperheight{250mm}
  \setlength\paperwidth {176mm}
}
\DeclareOption{landscape}{%
  \setlength\@tempdima  {\paperheight}%
  \setlength\paperheight{\paperwidth}%
  \setlength\paperwidth {\@tempdima}
}

\newcommand\@ptsize{}
\DeclareOption{8pt} {\renewcommand\@ptsize{8}}
\DeclareOption{9pt} {\renewcommand\@ptsize{9}}
\DeclareOption{10pt}{\renewcommand\@ptsize{10}}
\DeclareOption{11pt}{\renewcommand\@ptsize{11}}
\DeclareOption{12pt}{\renewcommand\@ptsize{12}}
\DeclareOption{14pt}{\renewcommand\@ptsize{14}}
\DeclareOption{16pt}{\renewcommand\@ptsize{16}}
\DeclareOption{18pt}{\renewcommand\@ptsize{18}}
\DeclareOption{20pt}{\renewcommand\@ptsize{20}}

\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}

\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}

\DeclareOption{titlepage}  {\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}

\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}

\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}

\DeclareOption{leqno}{\input{leqno.clo}}

\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{times}{\Dis@timestrue}
\DeclareOption{mtpro}{\Dis@mtprotrue}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
    \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
    }%
    \renewcommand\newblock{\par}
  }%
}

\DeclareOption{bachelor}{%
  \Dis@bachelortrue
  \Dis@specialistfalse
  \Dis@masterfalse
  \Dis@candidatefalse
  \Dis@doctorfalse
  \Dis@autoreffalse
}
\DeclareOption{specialist}{%
  \Dis@bachelorfalse
  \Dis@specialisttrue
  \Dis@masterfalse
  \Dis@candidatefalse
  \Dis@doctorfalse
  \Dis@autoreffalse
}
\DeclareOption{master}{%
  \Dis@bachelorfalse
  \Dis@specialistfalse
  \Dis@mastertrue
  \Dis@candidatefalse
  \Dis@doctorfalse
  \Dis@autoreffalse
}
\DeclareOption{candidate}{%
  \Dis@bachelorfalse
  \Dis@masterfalse
  \Dis@candidatetrue
  \Dis@doctorfalse
  \Dis@autoreffalse
}
\DeclareOption{doctor}{%
  \Dis@bachelorfalse
  \Dis@masterfalse
  \Dis@candidatefalse
  \Dis@doctortrue
  \Dis@autoreffalse
}
\DeclareOption{autoref}{%
  \Dis@bachelorfalse
  \Dis@masterfalse
  \Dis@candidatefalse
  \Dis@doctorfalse
  \Dis@autoreftrue
}

\SetupKeyvalOptions{
  family=Dis,
  prefix=Dis@
}

\DeclareBoolOption[true]{fixint}
\DeclareBoolOption[false]{colorlinks}
\DeclareStringOption{substylefile}

\ExecuteOptions{a4paper,14pt,oneside,titlepage,onecolumn,final,openany,candidate}
\ProcessKeyvalOptions{Dis}
\ProcessOptions

\ifx\Dis@substylefile\@empty
  \ifDis@bachelor   \renewcommand*{\Dis@substylefile}{bachelor.rtx}\fi
  \ifDis@specialist \renewcommand*{\Dis@substylefile}{specialist.rtx}\fi
  \ifDis@master     \renewcommand*{\Dis@substylefile}{master.rtx}\fi
  \ifDis@candidate  \renewcommand*{\Dis@substylefile}{candidate.rtx}\fi
  \ifDis@doctor     \renewcommand*{\Dis@substylefile}{doctor.rtx}\fi
  \ifDis@autoref    \renewcommand*{\Dis@substylefile}{autoref.rtx}\fi
\fi

\AtEndOfClass{\input{\Dis@substylefile}}

\RequirePackage[overload]{textcase}

\def\EC@family#1#2#3#4#5{%
  \DeclareFontShape{#1}{#2}{#3}{#4}%
  {<5><6><7><8><9><10><10.95><12><14.4><17.28><20.74>%
  <24.88><29.86><35.83><42.99><51.59>genb*#5}{}}

\EC@family{T1}{cmr}{m}{n}{ecrm}
\EC@family{T1}{cmr}{m}{sl}{ecsl}
\EC@family{T1}{cmr}{m}{it}{ecti}
\EC@family{T1}{cmr}{m}{sc}{eccc}
\EC@family{T1}{cmr}{bx}{n}{ecbx}
\EC@family{T1}{cmr}{b}{n}{ecrb}
\EC@family{T1}{cmr}{bx}{it}{ecbi}
\EC@family{T1}{cmr}{bx}{sl}{ecbl}
\EC@family{T1}{cmr}{bx}{sc}{ecxc}
\EC@family{T1}{cmr}{m}{ui}{ecui}

\DeclareFontShape{OT1}{cmr}{m}{n}{%
  <5><6><7><8><9><10><12>gen*cmr%
  <10.95>cmr10%
  <14.4>cmr12%
  <17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmr17%
}{}
\DeclareFontShape{OT1}{cmr}{m}{sl}{%
  <5><6><7>cmsl8%
  <8><9>gen*cmsl%
  <10><10.95>cmsl10%
  <12><14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmsl12%
}{}
\DeclareFontShape{OT1}{cmr}{m}{it}{%
  <5><6><7>cmti7%
  <8>cmti8%
  <9>cmti9%
  <10><10.95>cmti10%
  <12><14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmti12%
}{}
\DeclareFontShape{OT1}{cmr}{m}{sc}{%
  <5><6><7><8><9><10><10.95><12>%
  <14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmcsc10%
}{}
\DeclareFontShape{OT1}{cmr}{m}{ui}{%
  <5><6><7><8><9><10><10.95><12>%
  <14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmu10%
}{}
\DeclareFontShape{OT1}{cmr}{b}{n}{%
  <5><6><7><8><9><10><10.95><12>%
  <14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmb10%
}{}
\DeclareFontShape{OT1}{cmr}{bx}{n}{%
  <5><6><7><8><9>gen*cmbx%
  <10><10.95>cmbx10%
  <12><14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmbx12%
}{}
\DeclareFontShape{OT1}{cmr}{bx}{sl}{%
  <5><6><7><8><9>%
  <10><10.95><12><14.4><17.28><20.74><24.88><29.86><35.83><42.99>%
  <51.59>cmbxsl10%
}{}
\DeclareFontShape{OT1}{cmr}{bx}{it}{%
  <5><6><7><8><9>%
  <10><10.95><12><14.4><17.28><20.74><24.88><29.86><35.83><42.99>%
  <51.59>cmbxti10%
}{}
\input{size\@ptsize.clo}
\RequirePackage{exscale}

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape} {\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape} {\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape} {\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}

\providecommand\disser@deflength[2]{\newlength{#1}\setlength{#1}{#2}}
\providecommand\ifundeflength[2]{%
\ifx#1\undefined \newlength{#1}\setlength{#1}{#2} \else \relax \fi
}

\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}

\newcommand\disser@singlespacing {\renewcommand\baselinestretch{1}\normalsize}
\newcommand\disser@onehalfspacing{\renewcommand\baselinestretch{1.5}\normalsize}
\newcommand\disser@doublespacing {\renewcommand\baselinestretch{2}\normalsize}
\disser@onehalfspacing

\setlength\parindent{5ex}

\setlength\parskip{0\p@ \@plus \p@}

\setlength\columnsep{10\p@}

\setlength\columnseprule{0\p@}

\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

\let\@afterindentfalse\@afterindenttrue
\@afterindenttrue

\lccode`\-=`\-
\defaulthyphenchar=127
\newcommand\today{}


%%% From File: counters.dtx

\setcounter{tocdepth}{1}
\setcounter{secnumdepth}{2}

\newcounter{part}
\newcounter{chapter}
\newcounter{section}[chapter]
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]

\newcounter{figure}[chapter]
\newcounter{table}[chapter]


\renewcommand\thepart{\Roman{part}}
\renewcommand\thechapter{\arabic{chapter}}
\newcommand\theappendix{\Asbuk{chapter}}
\renewcommand\thesection{%
\ifnum\c@chapter > \z@
  \thechapter.\arabic{section}%
\else\arabic{section}\fi}
\renewcommand\thesubsection{\thesection.\arabic{subsection}}
\renewcommand\thesubsubsection{\thesubsection.\arabic{subsubsection}}
\renewcommand\theparagraph{\arabic{paragraph}}
\renewcommand\thesubparagraph{\theparagraph.\arabic{subparagraph}}

\newcommand\tocthepart{\thepart}
\newcommand\tocthechapter{\thechapter}
\newcommand\toctheappendix{\theappendix}
\newcommand\tocthesection{\thesection}
\newcommand\tocthesubsection{\thesubsection}
\newcommand\tocthesubsubsection{\thesubsubsection}
\newcommand\toctheparagraph{\theparagraph}
\newcommand\tocthesubparagraph{\thesubparagraph}

\newcommand\default@the{%
  \@addtoreset{footnote}{chapter}
  \@addtoreset{equation}{chapter}

  \renewcommand\theequation{%
    \ifnum\c@chapter > \z@\thechapter.\fi%
    \@arabic\c@equation}
  \renewcommand\thetable{%
    \ifnum \c@chapter>\z@\thechapter.\fi%
    \@arabic\c@table}
  \renewcommand\thefigure{%
    \ifnum \c@chapter>\z@\thechapter.\fi%
    \@arabic\c@figure}
}

%%% From File: part.dtx

\providecommand\tocprethepart{\partname~}
\providecommand\tocpostthepart{.\@postskip}
\providecommand\tocpartfill{}
\providecommand\tocpartfont{\bfseries}
\providecommand\tocpartfillfont{\normalfont}
\providecommand\tocpartnumfont{\normalfont}

\providecommand\thepartalign{\centering}
\providecommand\thepartfont{\huge}
\providecommand\prethepart{\tocprethepart}
\providecommand\postthepart{\par\vskip 20\p@}

\providecommand\partalign{\centering}
\providecommand\partfont{\huge\bfseries}
\providecommand\beforepart{}
\providecommand\afterpart{\par}

\def\partpagestyle#1{\gdef\@partpagestyle{#1}}
\partpagestyle{empty}
\def\@seccntformat#1{%
  \csname prethe#1\endcsname%
  \csname the#1\endcsname%
  \csname postthe#1\endcsname%
}

\def\@tocseccntformat#1{%
  \csname tocprethe#1\endcsname%
  \csname tocthe#1\endcsname%
  \csname tocpostthe#1\endcsname%
}

\newcommand\part{
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{\@partpagestyle}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil\secdef\@part\@spart
}
\def\@part[#1]#2{%
  \ifnum \c@secnumdepth >-2\relax
    \refstepcounter{part}%
    {\def\\{ }\addcontentsline{toc}{part}{\@tocseccntformat{part} #1}}
  \else
    {\def\\{ }\addcontentsline{toc}{part}{#1}}
  \fi
  \markboth{}{}%
  {%
    \interlinepenalty \@M
    \normalfont
    \ifnum \c@secnumdepth >-2\relax
      {\thepartfont\partalign\@seccntformat{part}}
    \fi%
    {\partfont\partalign\beforepart #2\afterpart}%
  }
  \@endpart%
}

\def\@spart#1{%
  \partalign{\interlinepenalty \@M%
    \partfont\beforepart #1\afterpart}%
  \@endpart
}

\def\@endpart{
  \vfil\newpage
  \if@twoside
    \null
    \thispagestyle{\partpagestyle}%
    \newpage
  \fi
  \if@tempswa\twocolumn\fi
}

\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \begingroup
      \setlength\@tempdima{3em}%
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode \tocpartfont #1\nobreak
      \tocpartfillfont\tocpartfill\hfill
      \hb@xt@\@pnumwidth{\hss\tocpartnumfont #2}}
      \par\nobreak
      \global\@nobreaktrue
      \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi
}


%%% From File: chapter.dtx

\providecommand\tocprethechapter{\protect\chaptername~}
\providecommand\tocpostthechapter{.\@postskip}
\providecommand\tocchapterfill{\tocfill{.}}

\providecommand\tocchapterfont{\bfseries}
\providecommand\tocchapterfillfont{\normalfont}
\providecommand\tocchapternumfont{\normalfont}

\providecommand\thechapteralign{\centering}
\providecommand\thechapterfont{\Large}
\providecommand\prethechapter{\protect\chaptername~}
\providecommand\postthechapter{\par\nobreak\vskip 5\p@}

\providecommand\chapteralign{\centering}
\providecommand\chapterfont{\Large\bfseries}
\providecommand\beforechapter{}
\providecommand\afterchapter{\par\nobreak\vskip 20\p@}
\newlength{\chapterindent}
\setlength{\chapterindent}{0\p@}

\newcommand*\chaptermark[1]{}

\newcommand\chapter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{\@chapterpagestyle}%
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter
}

\def\@chapter[#1]#2{
  \ifnum \c@secnumdepth >\m@ne
    \refstepcounter{chapter}%
    {\addcontentsline{toc}{chapter}{\@tocseccntformat{chapter} #1}}%
  \else
    {\addcontentsline{toc}{chapter}{#1}}%
  \fi
  \chaptermark{#1}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \if@twocolumn
    \@topnewpage[\@makechapterhead{#2}]%
  \else
    \@makechapterhead{#2}%
    \@afterheading
  \fi
}

\def\@makechapterhead#1{{%
  \parindent\z@
  \normalfont\hskip\chapterindent%
  \ifnum \c@secnumdepth >\m@ne
    {\thechapterfont\thechapteralign\@seccntformat{chapter}}
  \fi
  \interlinepenalty\@M
  \chapterfont\chapteralign\beforechapter #1\afterchapter
}}

\def\@schapter#1{
  \if@twocolumn
    \@topnewpage[\@makeschapterhead{#1}]%
  \else
    \@makeschapterhead{#1}%
    \@afterheading
  \fi
}

\def\@makeschapterhead#1{{%
  \parindent\z@
  \normalfont\hskip\chapterindent%
  \interlinepenalty\@M
  \chapteralign\chapterfont\beforechapter #1\afterchapter
}}

\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode\tocchapterfont
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak
      \tocchapterfillfont\tocchapterfill\hfill
      \nobreak\hb@xt@\@pnumwidth{\hss\tocchapternumfont #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi
}

\providecommand\tocpretheappendix{\protect\appendixname~}
\providecommand\tocposttheappendix{.\@postskip}
\providecommand\tocappendixfill{\tocfill{.}}

\providecommand\tocappendixfont{\bfseries}
\providecommand\tocappendixfillfont{\normalfont}
\providecommand\tocappendixnumfont{\normalfont}

\providecommand\theappendixalign{\centering}
\providecommand\theappendixfont{\Large}
\providecommand\pretheappendix{\protect\appendixname~}
\providecommand\posttheappendix{\par\nobreak\vskip 5\p@}

\providecommand\appendixalign{\centering}
\providecommand\appendixfont{\Large\bfseries}
\providecommand\beforeappendix{}
\providecommand\afterappendix{\par\nobreak\vskip 20\p@}
\providecommand\appendixindent{0\p@}
\newcommand\appendix{
  \setcounter{chapter}{0}
  \setcounter{section}{0}

  \let\oldtocprethechapter=\tocprethechapter
  \let\oldtocpostthechapter=\tocpostthechapter
  \let\oldtocchapterfill=\tocchapterfill

  \let\oldtocchapterfont=\tocchapterfont
  \let\oldtocchapterfillfont=\tocchapterfillfont
  \let\oldtocchapternumfont=\tocchapternumfont

  \let\oldthechapteralign=\thechapteralign
  \let\oldthechapterfont=\thechapterfont
  \let\oldprethechapter=\prethechapter
  \let\oldpostthechapter=\postthechapter

  \let\oldchapteralign=\chapteralign
  \let\oldchapterfont=\chapterfont
  \let\oldchapterindent=\chapterindent
  \let\oldbeforechapter=\afterchapter
  \let\oldafterchapter=\afterchapter
  \let\oldthechapter=\thechapter

  \renewcommand\tocprethechapter{\tocpretheappendix}
  \renewcommand\tocpostthechapter{\tocposttheappendix}
  \renewcommand\tocchapterfill{\tocappendixfill}

  \renewcommand\tocchapterfont{\tocappendixfont}
  \renewcommand\tocchapterfillfont{\tocappendixfillfont}
  \renewcommand\tocchapternumfont{\tocappendixnumfont}

  \renewcommand\thechapteralign{\theappendixalign}
  \renewcommand\thechapterfont{\theappendixfont}
  \renewcommand\prethechapter{\pretheappendix}
  \renewcommand\postthechapter{\posttheappendix}

  \renewcommand\chapteralign{\appendixalign}
  \renewcommand\chapterfont{\appendixfont}
  \renewcommand\beforechapter{\beforeappendix}
  \renewcommand\afterchapter{\afterappendix}
  \renewcommand\chapterindent{\appendixindent}

  \gdef\thechapter{\theappendix}
}

\newcommand\noappendix{
  \let\tocprethechapter=\oldtocprethechapter
  \let\tocpostthechapter=\oldtocpostthechapter
  \let\tocchapterfill=\oldtocchapterfill

  \let\tocchapterfont=\oldtocchapterfont
  \let\tocchapterfillfont=\oldtocchapterfillfont
  \let\tocchapternumfont=\oldtocchapternumfont

  \let\thechapteralign=\oldthechapteralign
  \let\thechapterfont=\oldthechapterfont
  \let\prethechapter=\oldprethechapter
  \let\postthechapter=\oldpostthechapter

  \let\chapteralign=\oldchapteralign
  \let\chapterfont=\oldchapterfont
  \let\beforechapter=\oldbeforechapter
  \let\afterchapter=\oldafterchapter

  \gdef\thechapter{\oldthechapter}
}


%%% From File: sections.dtx

\providecommand\tocprethesection{}
\providecommand\tocpostthesection{.\@postskip}
\providecommand\tocsectionfill{\tocfill{.}}

\providecommand\tocsectionfont{\normalfont}
\providecommand\tocsectionfillfont{}
\providecommand\tocsectionnumfont{}
\providecommand\tocsectionindent{1.5em}
\providecommand\tocsectionnameindent{2.6em}

\providecommand\sectionfont{\normalfont\large\bfseries}

\providecommand\prethesection{}
\providecommand\postthesection{.~}

\providecommand\sectionindent{\z@}
\providecommand\beforesection{-3.5ex \@plus -1ex \@minus -.2ex}
\providecommand\aftersection{2.3ex \@plus.2ex}
\providecommand\sectionalign{\raggedright}

\providecommand\tocprethesubsection{}
\providecommand\tocpostthesubsection{.\@postskip}
\providecommand\tocsubsectionfill{\tocfill{.}}

\providecommand\tocsubsectionfont{\normalfont}
\providecommand\tocsubsectionfillfont{}
\providecommand\tocsubsectionnumfont{}

\providecommand\tocsubsectionindent{4.1em}
\providecommand\tocsubsectionnameindent{3.5em}

\providecommand\subsectionfont{\normalfont\normalsize\bfseries}

\providecommand\prethesubsection{}
\providecommand\postthesubsection{.~}

\providecommand\subsectionindent{\z@}
\providecommand\beforesubsection{-3.25ex\@plus -1ex \@minus -.2ex}
\providecommand\aftersubsection{1.5ex \@plus .2ex}
\providecommand\subsectionalign{\raggedright}

\providecommand\tocprethesubsubsection{}
\providecommand\tocpostthesubsubsection{.\@postskip}
\providecommand\tocsubsubsectionfill{\tocfill{.}}

\providecommand\tocsubsubsectionfont{\normalfont}
\providecommand\tocsubsubsectionfillfont{}
\providecommand\tocsubsubsectionnumfont{}

\providecommand\tocsubsubsectionindent{7.6em}
\providecommand\tocsubsubsectionnameindent{4.7em}

\providecommand\subsubsectionfont{\normalfont\normalsize\bfseries}

\providecommand\prethesubsubsection{}
\providecommand\postthesubsubsection{.~}

\providecommand\subsubsectionindent{\z@}
\providecommand\beforesubsubsection{-3.25ex\@plus -1ex \@minus -.2ex}
\providecommand\aftersubsubsection{1.5ex \@plus .2ex}
\providecommand\subsubsectionalign{\raggedright}

\providecommand\tocpretheparagraph{}
\providecommand\tocposttheparagraph{.\@postskip}
\providecommand\tocparagraphfill{\tocfill{.}}

\providecommand\tocparagraphfont{\normalfont}
\providecommand\tocparagraphfillfont{}
\providecommand\tocparagraphnumfont{}

\providecommand\tocparagraphindent{10em}
\providecommand\tocparagraphnameindent{5em}

\providecommand\paragraphfont{\normalfont\normalsize\bfseries}

\providecommand\pretheparagraph{}
\providecommand\posttheparagraph{.~}

\providecommand\paragraphindent{\z@}
\providecommand\beforeparagraph{3.25ex \@plus1ex \@minus.2ex}
\providecommand\afterparagraph{-1em}
\providecommand\paragraphalign{}

\providecommand\tocprethesubparagraph{}
\providecommand\tocpostthesubparagraph{.\@postskip}
\providecommand\tocsubparagraphfill{\tocfill{.}}

\providecommand\tocsubparagraphfont{\normalfont}
\providecommand\tocsubparagraphfillfont{}
\providecommand\tocsubparagraphnumfont{}

\providecommand\tocsubparagraphindent{12em}
\providecommand\tocsubparagraphnameindent{6em}

\providecommand\subparagraphfont{\normalfont\normalsize\bfseries}

\providecommand\prethesubparagraph{}
\providecommand\postthesubparagraph{.~}

\providecommand\subparagraphindent{\parindent}
\providecommand\subparagraphalign{\raggedright}
\providecommand\beforesubparagraph{3.25ex \@plus1ex \@minus .2ex}
\providecommand\aftersubparagraph{-1em}

\def\@startsection#1#2{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa \csname before#1\endcsname\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\@ssect{\csname #1indent\endcsname}%
            {\csname before#1\endcsname}{\csname after#1\endcsname}%
            {\csname #1font\endcsname\csname #1align\endcsname}}%
    {\@dblarg{\@sect{#1}{#2}{\csname #1indent\endcsname}%
            {\csname before#1\endcsname}{\csname after#1\endcsname}%
            {\csname #1font\endcsname\csname #1align\endcsname}}}%
}

\def\@ssect#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #4{%
        \@hangfrom{\hskip #1}%
          \interlinepenalty \@M #5\@@par}%
    \endgroup
  \else
    \def\@svsechd{#4{\hskip #1\relax #5}}%
  \fi
  \@xsect{#3}%
}

\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M #8\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\@tocseccntformat{#1}}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\@tocseccntformat{#1}}%
        \fi
        #7}%
    }%
  \fi
  \@xsect{#5}%
}

\def\@tocline#1#2#3#4{%
  \ifnum #2>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip \csname toc#1indent\endcsname\relax%
     \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent \csname toc#1indent\endcsname\relax%
     \@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima \csname toc#1nameindent\endcsname\relax
     \csname toc#1font\endcsname
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#3}\nobreak
     \csname toc#1fillfont\endcsname \csname toc#1fill\endcsname\hfill
     \nobreak\hb@xt@\@pnumwidth{\hfil\csname toc#1numfont\endcsname #4}%
     \par%
    }%
  \fi
}

\newcommand\section{\@startsection{section}{1}}
\newcommand*\l@section{\@tocline{section}{1}}

\newcommand\subsection{\@startsection{subsection}{2}}
\newcommand*\l@subsection{\@tocline{subsection}{2}}

\newcommand\subsubsection{\@startsection{subsubsection}{3}}
\newcommand*\l@subsubsection{\@tocline{subsubsection}{3}}

\newcommand\paragraph{\@startsection{paragraph}{4}}
\newcommand*\l@paragraph{\@tocline{paragraph}{4}}

\newcommand\subparagraph{\@startsection{subparagraph}{5}}
\newcommand*\l@subparagraph{\@tocline{subparagraph}{5}}


%%% From File: lists.dtx

\if@twocolumn
  \setlength\leftmargini {2em}
\else
  \setlength\leftmargini {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength\labelsep{.5em}
\setlength\labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty

\renewcommand\theenumi  {\@arabic\c@enumi}
\renewcommand\theenumii {\disser@asbuk\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv {\disser@Asbuk\c@enumiv}
\newcommand\labelenumi  {\theenumi.}
\newcommand\labelenumii {\theenumii.}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv {\theenumiv.}
\renewcommand\p@enumii  {\theenumi}
\renewcommand\p@enumiii {\theenumi.\theenumii}
\renewcommand\p@enumiv  {\p@enumiii.\theenumiii}
\newcommand\labelitemi  {\textbullet}
\newcommand\labelitemii {\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv {\textperiodcentered}

%%% From File: floats.dtx

\setcounter{topnumber}{2}
\setcounter{bottomnumber}{1}
\setcounter{totalnumber}{3}
\setcounter{dbltopnumber}{2}
\renewcommand\topfraction{.7}
\renewcommand\bottomfraction{.3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\disser@deflength\abovecaptionskip{10\p@}
\disser@deflength\belowcaptionskip{0\p@}
\newcommand\captionlabeldelim{.}
\newcommand\captionfont{\small}
\newcommand\captionlabelfont{\small\selectfont}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{{\captionlabelfont #1\captionlabeldelim} {\captionfont #2}}%
  \ifdim \wd\@tempboxa >\hsize
    {{\captionlabelfont  #1\captionlabeldelim} {\captionfont #2}}\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip
}

\renewcommand\thefigure{\ifnum \c@chapter>\z@\thechapter.\fi\@arabic\c@figure}

\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}

\renewcommand\thetable{\ifnum \c@chapter>\z@\thechapter.\fi\@arabic\c@table}

\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}

\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}


%%% From File: footnote.dtx

\def\thefootnote{\@arabic\c@footnote}

\def\thempfootnote{{\itshape\@alph\c@mpfootnote}}

\def\footnoterule{%
  \kern-3\p@\hrule\@width.4\columnwidth\kern2.6\p@
}

\providecommand\prethefootnote{}
\providecommand\postthefootnote{}
\providecommand\prefootnote{\;}
\disser@deflength{\footnoteindent}{\parindent}

\def\@makefnmark{\hbox{\prethefootnote%
\@textsuperscript{\normalfont\@thefnmark}%
\postthefootnote}}

\newcommand\@makefntext[1]{%
  \noindent\hspace{\footnoteindent}%
  \@makefnmark\prefootnote #1
}


%%% From File: env.dtx

\newenvironment{description}
  {\list{}{\labelwidth\z@ \itemindent-\leftmargin
    \let\makelabel\descriptionlabel}}
  {\endlist}

\newcommand*\descriptionlabel[1]{\hspace\labelsep\normalfont\bfseries #1}

\newcommand\abstractnamefont{\bfseries\small}
\newcommand\abstractfont{\small}
\newcommand\postabstract{\par\vfil\null}

\if@titlepage
  \newenvironment{abstract}{
    \thispagestyle{empty}
    \@beginparpenalty\@lowpenalty
    \begin{center}%
      \abstractnamefont\abstractname
      \@endparpenalty\@M
    \end{center}\abstractfont
  }{\postabstract}
\else
  \newenvironment{abstract}{
    \if@twocolumn
      \section*{\abstractname}
    \else
      \begin{center}
        {\abstractnamefont\vspace{-.5em}\vspace{\z@}}%
      \end{center}\abstractfont
      \quotation
    \fi
  }{\if@twocolumn\else\endquotation\fi}
\fi

\newenvironment{quotation}{
  \list{}{
    \listparindent 1.5em
    \itemindent\listparindent
    \rightmargin\leftmargin
    \parsep\z@ \@plus\p@
  }
  \item\relax
}{\endlist}

\newenvironment{quote}{
  \list{}{\rightmargin\leftmargin}
  \item\relax
}{\endlist}

\newenvironment{titlepage}{
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse\newpage
  \fi
  \thispagestyle{empty}
  \setcounter{page}\@ne
}{
  \if@restonecol\twocolumn\else\newpage\fi
  \if@twoside\else\setcounter{page}\@ne\fi
}

\newenvironment{figure}{\@float{figure}}{\end@float}
\newenvironment{figure*}{\@dblfloat{figure}}{\end@dblfloat}
\newenvironment{table}{\@float{table}}{\end@float}
\newenvironment{table*}{\@dblfloat{table}}{\end@dblfloat}

\def\newtheorem#1{%
  {
    \global\@namedef{#1style}{\itshape}
    \global\@namedef{the#1style}{\bfseries}
    \global\@namedef{postthe#1}{.}
    \global\@namedef{oparg#1style}{\upshape}
    \global\@namedef{preoparg#1}{(}
    \global\@namedef{postoparg#1}{)}
  }
  \@ifnextchar[{\@othm{#1}}{\@nthm{#1}}%
}

\def\@xthm#1#2{%
  \@begintheorem{#1}{#2}\ignorespaces}
\def\@ythm#1#2[#3]{%
  \@opargbegintheorem{#1}{#2}{#3}\ignorespaces}

\def\@begintheorem#1#2{\trivlist
  \item[\hskip\labelsep%
  {\csname the#1style\endcsname #2\ %
  \csname the#1\endcsname\unskip\csname postthe#1\endcsname}]%
  \csname #1style\endcsname%
}

\def\@opargbegintheorem#1#2#3{\trivlist
  \item[\hskip\labelsep%
  {\csname the#1style\endcsname #2\ \csname the#1\endcsname}\ %
  {\csname oparg#1style\endcsname%
  \csname preoparg#1\endcsname #3%
  \csname postoparg#1\endcsname}]%
  \csname #1style\endcsname%
}

\def\@endtheorem{\endtrivlist}


%%% From File: page.dtx

\newcommand\evenheadfont{\reset@font}
\newcommand\evenfootfont{\reset@font}
\newcommand\oddheadfont{\reset@font}
\newcommand\oddfootfont{\reset@font}
\newcommand\headfont{\reset@font}
\newcommand\footfont{\reset@font}
\def\ps@empty{
  \let\@mkboth\@gobbletwo
  \let\@oddhead\@empty
  \let\@oddfoot\@empty
  \let\@evenhead\@empty
  \let\@evenfoot\@empty
}

\def\ps@footcenter{
  \let\@mkboth\@gobbletwo
  \let\@oddhead\@empty
  \let\@evenhead\@empty
  \def\@oddfoot{\footfont\hfil\thepage\hfil}
  \def\@evenfoot{\footfont\hfil\thepage\hfil}
}

\if@twoside
  \def\ps@footleft{
    \let\@mkboth\@gobbletwo
    \let\@oddhead\@empty
    \let\@evenhead\@empty
    \def\@oddfoot{\oddfootfont\hfil\thepage}
    \def\@evenfoot{\evenfootfont\thepage\hfil}
  }
\else
  \def\ps@footleft{
    \let\@mkboth\@gobbletwo
    \let\@oddhead\@empty
    \let\@evenhead\@empty
    \def\@oddfoot{\footfont\thepage\hfil}
    \def\@evenfoot{\footfont\thepage\hfil}
  }
\fi

\if@twoside
  \def\ps@footright{
    \let\@mkboth\@gobbletwo
    \let\@oddhead\@empty
    \let\@evenhead\@empty
    \def\@oddfoot{\oddfootfont\thepage\hfil}
    \def\@evenfoot{\evenfootfont\hfil\thepage}
  }
\else
  \def\ps@footright{
    \let\@mkboth\@gobbletwo
    \let\@oddhead\@empty
    \let\@evenhead\@empty
    \def\@oddfoot{\footfont\hfil\thepage}
    \def\@evenfoot{\footfont\hfil\thepage}
  }
\fi

\def\ps@headcenter{
  \let\@mkboth\@gobbletwo
  \def\@oddhead{\headfont\hfil\thepage\hfil}
  \def\@evenhead{\headfont\hfil\thepage\hfil}
  \let\@oddfoot\@empty
  \let\@evenfoot\@empty
}

\if@twoside
  \def\ps@headright{
    \let\@mkboth\@gobbletwo
    \def\@oddhead{\oddheadfont\thepage\hfil}
    \def\@evenhead{\evenheadfont\hfil\thepage}
    \let\@oddfoot\@empty
    \let\@evenfoot\@empty
  }
\else
  \def\ps@headright{
    \let\@mkboth\@gobbletwo
    \def\@oddhead{\headfont\hfil\thepage}
    \def\@oddhead{\headfont\hfil\thepage}
    \let\@oddfoot\@empty
    \let\@evenfoot\@empty
  }
\fi

\if@twoside
  \def\ps@headleft{
    \let\@mkboth\@gobbletwo
    \def\@oddhead{\oddheadfont\hfil\thepage}
    \def\@evenhead{\evenheadfont\thepage\hfil}
    \let\@oddfoot\@empty
    \let\@evenfoot\@empty
  }
\else
  \def\ps@headleft{
    \let\@mkboth\@gobbletwo
    \def\@oddhead{\headfont\thepage\hfil}
    \def\@evenhead{\headfont\thepage\hfil}
    \let\@oddfoot\@empty
    \let\@evenfoot\@empty
  }
\fi

\let\ps@plain=\ps@footcenter

\pagestyle{headcenter}

\def\chapterpagestyle#1{\gdef\@chapterpagestyle{#1}}

\chapterpagestyle{headcenter}
\pagenumbering{arabic}
\if@twoside\else\raggedbottom\fi
\if@twocolumn
  \twocolumn\sloppy\flushbottom
\else
  \onecolumn
\fi


\input{titledefs.rtx}

\if@titlepage
  \newcommand\titlefont{\Large\bfseries}
  \newcommand\topiclabelfont{\large}
  \newcommand\topicfont{\large\bfseries}
  \newcommand\instfont{\normalfont}
  \newcommand\cdsep{~-- }

  \newcommand\maketitle{}
  \setcounter{footnote}{0}
\else
  \newcommand\maketitle{%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@maketitle\relax
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\title\relax
    \global\let\author\relax
    \global\let\date\relax
    \global\let\and\relax
  }
  \def\@maketitle{%
    \newpage
    \null
    \vskip 2em%
    \begin{center}%
      \let\footnotesize\small
      \let\footnote\thanks
      {\titlefont\@title\par}%
      \vskip 1.5em%
      {\large\lineskip .5em%
        \begin{tabular}[t]{c}%
          \@author
        \end{tabular}\par}%
        \vskip 1em%
      {\large \@date}%
    \end{center}%
    \par\vskip 1.5em%
  }
\fi % \if@titlepage

%%% From File: toc.dtx

\def\@postskip{\texorpdfstring{\hskip1em}{  }}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\def\tocfill#1{%
  \leaders\hbox{$\m@th\mkern\@dotsep mu\hbox{#1}\mkern\@dotsep mu$}%
}

\newcommand\tocsection{\chapter*{\contentsname}}

\newcommand\tableofcontents{%
  \if@twocolumn%
    \@restonecoltrue\onecolumn%
  \else\@restonecolfalse\fi%
  \tocsection%
  \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
  \@starttoc{toc}%
  \if@restonecol\twocolumn\fi
  \clearpage
}
\newcommand\lofsection{\nchapter{\listfigurename}}

\newcommand\listoffigures{%
  \if@twocolumn\@restonecoltrue\onecolumn%
  \else\@restonecolfalse\fi%
  \lofsection%
  \@mkboth{\MakeUppercase\listfigurename}{\MakeUppercase\listfigurename}%
  \@starttoc{lof}%
  \if@restonecol\twocolumn\fi
}

\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}

\newcommand\lotsection{\nchapter{\listtablename}}

\newcommand\listoftables{%
  \if@twocolumn\@restonecoltrue\onecolumn%
  \else\@restonecolfalse\fi%
  \lotsection%
  \@mkboth{\MakeUppercase\listtablename}{\MakeUppercase\listtablename}%
  \@starttoc{lot}%
  \if@restonecol\twocolumn\fi
}

\let\l@table\l@figure

\newenvironment{thebibliography}[1]{}{}

\newdimen\bibindent
\setlength\bibindent{1.5em}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty

\providecommand\indexsection{\twocolumn[\@makeschapterhead{\indexname}]}

\newenvironment{theindex}{%
  \if@twocolumn\@restonecolfalse%
  \else\@restonecoltrue\fi%
  \columnseprule \z@
  \columnsep 35\p@
  \indexsection%
  \@mkboth{\MakeUppercase\indexname}{\MakeUppercase\indexname}%
  \thispagestyle{plain}
  \parindent\z@
  \parskip\z@ \@plus .3\p@\relax
  \let\item\@idxitem%
}{\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}

%%% From File: custom.dtx

\ifDis@ams
  \usepackage[intlimits]{amsmath}
  \usepackage{amssymb,amsfonts}
\fi

\ifDis@times
  \AtBeginDocument{
    \DeclareRobustCommand{\English}{%
      \expandafter\set@hyphenmins\englishhyphenmins
      \language\l@english}%
    \let\Eng=\English
  }
  \ifDis@mtpro
    \AtBeginDocument{%
      \IfFileExists{mtpro2.sty}{
        \usepackage[subscriptcorrection,nofontinfo]{mtpro2}
      }{
        \IfFileExists{mtpro.sty}{
          \usepackage[subscriptcorrection,nofontinfo,boldalphabet]{mtpro}
        }{
          \PackageWarning{disser}%
            {Unable to find mtpro package. Font is unchanged.}
        }
      }
    }
  \else
  \AtEndOfPackage{%
    \IfFileExists{txfonts.sty}{
      \usepackage{txfonts}
    }{
      \PackageWarning{disser}%
        {Unable to find txfonts package. Font is unchanged.}
    }
  }
  \fi
  \AtEndOfPackage{%
    \IfFileExists{pscyr.sty}{
      \usepackage{pscyr}
      \renewcommand\rmdefault{ftm}
      \renewcommand\ttdefault{cmtt}
    }{
      \IfFileExists{cyrtimes.sty}{
        \usepackage{cyrtimes}
      }{
        \PackageWarning{disser}%
          {Unable to find pscyr or cyrtimes package. Font is unchanged.}
      }
    }
  }
\fi

\ifDis@fixint
  \DeclareSymbolFont{EulerExtension}{U}{euex}{m}{n}
  \DeclareMathSymbol\intop\mathop{EulerExtension}{"52}
  \DeclareMathSymbol\ointop\mathop{EulerExtension}{"48}
  \AtBeginDocument{%
    \def\intkern@{\mkern -6mu }%
    \def\ints@#1{\mkern -3mu
      \mathop{\mkern 3mu
        \intop
        \ifnum #1=\z@ \intdots@ \else
          \intkern@
          \ifnum #1>\tw@ \intop\intkern@
            \ifnum #1>\thr@@ \intop\intkern@ \fi
          \fi
        \fi
        \intop
       }\ilimits@
    }%
    \renewcommand{\iint}{\DOTSI\protect\MultiIntegral{2}}
    \renewcommand{\iiint}{\DOTSI\protect\MultiIntegral{3}}
    \renewcommand{\iiiint}{\DOTSI\protect\MultiIntegral{4}}
    \renewcommand{\idotsint}{\DOTSI\protect\MultiIntegral{0}}
  }{}
\fi

\ifDis@natbib
  \usepackage[square,comma,sort&compress,numbers]{natbib}
\else
  \newcommand\bibsection{}
  \newcommand\bibpreamble{}
  \newcommand\bibpostamble{}
  \newcommand\bibfont{\normalfont\selectfont}
  \newlength\bibsep
\fi

\renewcommand\bibsection{\nchapter{\bibname}}

\renewcommand\bibpreamble{%
  \renewcommand\@biblabel[1]{##1.}%
  \setlength\bibsep{0pt}
}

\@ifpackageloaded{natbib}{
  \@ifundefined{chapter}{%
    \renewcommand\bibsection{%
     \nsection{\bibname\@mkboth{\MakeUppercase{\bibname}}{\MakeUppercase{\bibname}}}%
    }%
  }{%
    \@ifxundefined\NAT@sectionbib{%
      \renewcommand\bibsection{%
        \nchapter{\bibname\@mkboth{\MakeUppercase{\bibname}}{\MakeUppercase{\bibname}}}%
      }%
    }{%
      \renewcommand\bibsection{%
        \nsection{\bibname\ifx\@mkboth\@gobbletwo\else\markright{\MakeUppercase{\bibname}}\fi}%
      }%
    }%
  }%
}{%
  \@ifundefined{chapter}{%
    \renewcommand\bibsection{%
     \nsection{\bibname\@mkboth{\MakeUppercase{\bibname}}{\MakeUppercase{\bibname}}}%
    }%
  }{}
  \renewenvironment{thebibliography}[1]{
    \bibsection
    \parindent\z@
    \bibpreamble\bibfont
    \list{\@biblabel{\@arabic\c@enumiv}}{\settowidth\labelwidth{\@biblabel{#1}}%
    \setlength{\itemsep}{\bibsep}
    \setlength{\parsep}{\bibsep}
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \@openbib@code
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.\@m
  }{%
    \bibpostamble
    \def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist
  }
}

\ifDis@subf
  \usepackage[config,font=small,labelsep=period]{caption}
  \usepackage[list=true,subrefformat=parens]{subcaption}
  \DeclareCaptionSubType[asbuk]{figure}
  \def\thesubfigure{\textit{\asbuk{subfigure}}}
  \providecommand\thefigsubsep{,~}
  \def\p@subfigure{\@nameuse{thefigure}\thefigsubsep}
\fi

\ifpdf
  \ifDis@href
    \usepackage[pdftex,unicode]{hyperref}
    \hypersetup{
      colorlinks         = false,
      bookmarksopen      = true,
      bookmarksnumbered  = true,
      bookmarksopenlevel = 2,
      pdfstartview       = {FitH},
      pdfborder          = {0 0 0}
    }
    \pdfcompresslevel = 9
  \fi
  \usepackage[pdftex]{graphicx}
  \usepackage{cmap}
\else
  \ifDis@href
    \usepackage[hypertex,colorlinks=false]{hyperref}
  \fi
  \usepackage{graphicx}
\fi
\ifDis@href
  \ifDis@colorlinks
    \usepackage{color}
    \definecolor{darkblue}{rgb}{0,0,.6}
    \hypersetup{
      colorlinks = true,     linkcolor  = darkblue,
      citecolor  = darkblue, filecolor  = darkblue,
      menucolor  = darkblue, urlcolor   = darkblue
    }
  \fi
\fi

\providecommand\hrefphantom[1]{%
  \ifDis@href
    \Hy@GlobalStepCount\Hy@linkcounter
    \xdef\@currentHref{#1*.\the\Hy@linkcounter}%
    \Hy@raisedlink{\hyper@anchorstart{\@currentHref}\hyper@anchorend}%
  \fi
}

\newcommand\nchapter[1]{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{\@chapterpagestyle}%
  \global\@topnum\z@
  \hrefphantom{chapter}
  \addcontentsline{toc}{chapter}{#1}%
  \@afterindentfalse
  \@schapter{#1}
}
\newcommand\nsection[1]{%
  \hrefphantom{section}%
  \addcontentsline{toc}{section}{#1}
  \section*{#1}
}
\newcommand\nsubsection[1]{%
  \hrefphantom{subsection}%
  \addcontentsline{toc}{subsection}{#1}
  \subsection*{#1}
}
\newcommand\nsubsubsection[1]{%
  \hrefphantom{subsubsection}%
  \addcontentsline{toc}{subsubsection}{#1}
  \subsubsection*{#1}
}

\endinput
%%
%% End of file `disser.cls'.
