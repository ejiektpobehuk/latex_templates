%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LaTeX class for dissertations
%
% Designed for SPbSPU, FCS, CSSE department
%
% Created by: Marat Akhin (akhin@kspt.ftk.spbstu.ru)
% Based on: `disser` package
% Distrubuted under: LPPL 1.3+
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csse-fcs}[2013/01/20 CSSE FCS dissertation class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{kvoptions}
\RequirePackage{geometry}
\RequirePackage{nomencl}
\RequirePackage{indentfirst}
\RequirePackage{xstring}
\RequirePackage{float}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}

\AtEndOfClass{\RequirePackage{caption}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\SetupKeyvalOptions{
  family=csse,
  prefix=csse@
}
\DeclareStringOption{titlefile}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@afivepaper\@afivepapertrue
\newif\if@afourpaper\@afourpaperfalse
\DeclareOption{a5paper}{
  \@afivepapertrue
  \@afourpaperfalse
}
\DeclareOption{a4paper}{
  \@afivepaperfalse
  \@afourpapertrue
}
\if@afivepaper
  \PassOptionsToClass{a5paper,10pt}{disser}
\fi
\if@afourpaper
  \PassOptionsToClass{a4paper,14pt}{disser}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@usedotsinheaders\@usedotsinheadersfalse
\DeclareOption{dotsinheaders}{
  \@usedotsinheaderstrue
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@coverpage\@coverpagetrue
\newif\if@coverpage@en\@coverpage@enfalse

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@mastertitle\@mastertitletrue
\DeclareOption{master}{
  \@mastertitletrue
}
\ifx\csse@titlefile\@empty
  \if@mastertitle \renewcommand*{\csse@titlefile}{csse-master.rtx} \fi
\fi
\AtEndOfClass{\input{\csse@titlefile}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\PassOptionsToClass{
  twoside,
  titlepage,
  openright,
  onecolumn,
  bachelor
}{disser}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{disser}}

\ProcessKeyvalOptions{kspt}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass{disser}[2011/11/29]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@afivepaper
  \renewcommand\@approved{
    \begin{tabbing}
      \hspace{5.5cm}\={\approved}\\
      \>\appos\\[1ex]
      \>\makebox[5cm][r]{\hrulefill\ \@apname}\\[1ex]
      \>\makebox[1cm][r]{<<\hrulefill>>}
      \makebox[4cm][r]{\hrulefill\ \@date\,\yearname}
    \end{tabbing}
  }
  \geometry{
    paper=a5paper,
    %nohead=true,
    includefoot=true,
    left=30mm,
    right=10mm,
    top=20mm,
    bottom=20mm,
    footskip=10mm
  }
  \setlength{\fieldhshift}{5cm}
  \setlength{\parindent}{0.7cm}
  \renewcommand{\nomlabelwidth}{2cm}
  \singlespacing
\fi

\if@afourpaper
  \geometry{
    paper=a4paper,
    nohead=true,
    includefoot=true,
    left=30mm,
    right=10mm,
    top=20mm,
    bottom=20mm,
    footskip=15mm
  }
  \setlength{\fieldhshift}{8.5cm}
  \renewcommand{\nomlabelwidth}{3cm}
  \onehalfspacing
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\blankpagecontent[1]{
  \gdef\@blankpagecontent{#1}
}
\blankpagecontent{}
\newcommand\makeblankpage{
  \ifx\@blankpagecontent
    \empty
  \else
    \begin{center}
      \@blankpagecontent
    \end{center}
  \fi
  \thispagestyle{empty}
  \clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\csseabstractname{%
  \CYRR\CYRE\CYRF\CYRE\CYRR\CYRA\CYRT
}
\newcommand\csseabstractnameen{%
  ABSTRACT%
}
\newcommand\stats@report{%
  \CYRO\cyrt\cyrch\cyre\cyrt%
}
\newcommand\stats@report@en{%
  Report%
}
\newcommand\stats@page{%
  \cyrs\cyrt\cyrr.%
}
\newcommand\stats@page@en{%
  pages%
}
\newcommand\stats@fig{%
  \cyrr\cyri\cyrs.%
}
\newcommand\stats@fig@en{%
  figures%
}
\newcommand\stats@table{%
  \cyrt\cyra\cyrb\cyrl.%
}
\newcommand\stats@table@en{%
  tables%
}
\newcommand\stats@cite{%
  \cyri\cyrs\cyrt.%
}
\newcommand\stats@cite@en{%
  references%
}
\newcommand\stats@appendix{%
  \cyrp\cyrr\cyri\cyrl.%
}
\newcommand\stats@appendix@en{%
  appendicies%
}
\newcommand\@stats[5]{%
  \stats@report%
  \IfEq{#1}{0}{}{%
  , #1~\stats@page%
  }%
  \IfEq{#2}{0}{}{%
  , #2~\stats@fig%
  }%
  \IfEq{#3}{0}{}{%
  , #3~\stats@table%
  }%
  \IfEq{#4}{0}{}{%
  , #4~\stats@cite%
  }%
  \IfEq{#5}{0}{}{%
  , #5~\stats@appendix%
  }%
}
\newcommand\@stats@en[5]{%
  \stats@report@en%
  \IfEq{#1}{0}{}{%
  , #1~\stats@page@en%
  }%
  \IfEq{#2}{0}{}{%
  , #2~\stats@fig@en%
  }%
  \IfEq{#3}{0}{}{%
  , #3~\stats@table@en%
  }%
  \IfEq{#4}{0}{}{%
  , #4~\stats@cite@en%
  }%
  \IfEq{#5}{0}{}{%
  , #5~\stats@appendix@en%
  }%
}

\newcommand\pagecount[1]{%
  \xdef\@pagecount{#1}
}\pagecount{0}
\newcommand\figcount[1]{%
  \xdef\@figcount{#1}
}\figcount{0}
\newcommand\tablecount[1]{%
  \xdef\@tablecount{#1}
}\tablecount{0}
\newcommand\citecount[1]{%
  \xdef\@citecount{#1}
}\citecount{0}
\newcommand\appendixcount[1]{%
  \xdef\@appendixcount{#1}
}\appendixcount{0}

\newcommand\abstractcontent[1]{%
  \gdef\@abstractcontent{#1}
}\abstractcontent{}
\newcommand\abstractcontenten[1]{%
  \gdef\@abstractcontent@en{#1}
}\abstractcontenten{}

\newcommand\keywordsen[1]{%
  \gdef\@keywords@en{#1}
}\keywordsen{}

\newcommand\@makeabstract[4]{%
  \clearpage%
  \thispagestyle{empty}%
  %
  \@makeschapterhead{#1}%
  \@afterheading%
  %
  \begin{center}%
  #2%
  \end{center}%
  %
  \begin{center}%
    \MakeUppercase{#3}%
  \end{center}
  %
  {%
    \hskip\parindent%
    #4%
  }
}

\newcommand\makeabstractru{%
  \@makeabstract{%
    \csseabstractname}{%
    \@stats{%
      \@pagecount}{%
      \@figcount}{%
      \@tablecount}{%
      \@citecount}{%
      \@appendixcount%
    }}{%
    \@keywords}{%
    \@abstractcontent%
  }
}
\newcommand\makeabstracten{%
  \@makeabstract{%
    \csseabstractnameen}{%
    \@stats@en{%
      \@pagecount}{%
      \@figcount}{%
      \@tablecount}{%
      \@citecount}{%
      \@appendixcount%
    }}{%
    \@keywords@en}{%
    \@abstractcontent@en%
  }
}
\newcommand\makeabstract{%
  \makeabstractru%
  \makeabstracten%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcounter{total@page}
\newcounter{total@figure}
\newcounter{total@table}
\newcounter{total@cite}
\newcounter{total@appendix}

\gdef\total@page{0}
\gdef\total@figure{0}
\gdef\total@table{0}
\gdef\total@cite{0}
\gdef\total@appendix{0}

\AtEndOfClass{
\AtBeginDocument{
  \pagecount{\total@page}
  \figcount{\total@figure}
  \tablecount{\total@table}
  \citecount{\total@cite}
  \appendixcount{\total@appendix}
}
}

\AtEndDocument{
  \setcounter{total@page}{\value{page}}
  %
  \addtocounter{total@figure}{\value{figure}}
  \addtocounter{total@table}{\value{table}}
  %
  \immediate\write\@mainaux{
    \string\gdef\string\total@page{\number\value{total@page}}
    \string\gdef\string\total@figure{\number\value{total@figure}}
    \string\gdef\string\total@table{\number\value{total@table}}
    \string\gdef\string\total@cite{\number\value{total@cite}}
    \string\gdef\string\total@appendix{\number\value{total@appendix}}
  }
}

\def\oldchapter{}
\let\oldchapter=\chapter
\def\chapter{%
  \addtocounter{total@figure}{\value{figure}}%
  \addtocounter{total@table}{\value{table}}%
  \stepcounter{total@appendix}%
  \oldchapter%
}

\def\old@chapter[#1]#2{}
\let\old@chapter=\@chapter
\def\@chapter[#1]#2{
  \old@chapter[\texorpdfstring{\noexpand\MakeTextUppercase{#1}}{#1}]{\MakeTextUppercase{#2}}
}

\def\oldbibcite{}
\let\oldbibcite=\bibcite
\def\bibcite{%
  \stepcounter{total@cite}%
  \oldbibcite%
}

\def\oldappendix{}
\let\oldappendix=\appendix
\def\appendix{%
  \setcounter{total@appendix}{0}%
  \oldappendix%
}

\def\oldnoappendix{}
\let\oldnoappendix=\noappendix
\def\noappendix{%
  \setcounter{total@appendix}{0}%
  \oldnoappendix%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Default settings

\AtEndOfClass{
\AtBeginDocument{

\clearpage

\institution{{\cyr\CYRS\cyra\cyrn\cyrk\cyrt-\CYRP\cyre\cyrt\cyre\cyrr\cyrb\cyru\cyrr\cyrg\cyrs\cyrk\cyri\cyrishrt\ \cyrp\cyro\cyrl\cyri\cyrt\cyre\cyrh\cyrn\cyri\cyrch\cyre\cyrs\cyrk\cyri\cyrishrt\ \cyru\cyrn\cyri\cyrv\cyre\cyrr\cyrs\cyri\cyrt\cyre\cyrt\
\CYRP\cyre\cyrt\cyrr\cyra\
\CYRV\cyre\cyrl\cyri\cyrk\cyro\cyrg\cyro}}
\faculty{{\cyr\CYRI\cyrn\cyrs\cyrt\cyri\cyrt\cyru\cyrt\ %
  \cyrk\cyro\cyrm\cyrp\cyrsftsn\cyryu\cyrt\cyre\cyrr\cyrn\cyrery\cyrh\ %
  \cyrn\cyra\cyru\cyrk\ \cyri\ %
  \cyrt\cyre\cyrh\cyrn\cyro\cyrl\cyro\cyrg\cyri\cyrishrt}}
\department{{\cyr\CYRK\cyra\cyrf\cyre\cyrd\cyrr\cyra\ \cyrk\cyro\cyrm\cyrp\cyrsftsn\cyryu\cyrt\cyre\cyrr\cyrn\cyrery\cyrh\ \cyrs\cyri\cyrs\cyrt\cyre\cyrm\ \cyri\ \cyrp\cyrr\cyro\cyrg\cyrr\cyra\cyrm\cyrm\cyrn\cyrery\cyrh\ \cyrt\cyre\cyrh\cyrn\cyro\cyrl\cyro\cyrg\cyri\cyrishrt}}

\city{{\cyr\CYRS\cyra\cyrn\cyrk\cyrt-\CYRP\cyre\cyrt\cyre\cyrr\cyrb\cyru\cyrr\cyrg}}
\date{\number\year}

%\renewcommand{\courselabel}{}
%\renewcommand{\masterproglabel}{}

\addto\captionsrussian{%
  \renewcommand{\nomname}{\CYRS\CYRP\CYRI\CYRS\CYRO\CYRK\ \CYRO\CYRB\CYRO\CYRZ\CYRN\CYRA\CYRCH\CYRE\CYRN\CYRI\CYRISHRT\ \CYRI\ \CYRS\CYRO\CYRK\CYRR\CYRA\CYRSHCH\CYRE\CYRN\CYRI\CYRISHRT}
  \renewcommand{\contentsname}{\CYRS\CYRO\CYRD\CYRE\CYRR\CYRZH\CYRA\CYRN\CYRI\CYRE}
  \renewcommand{\introname}{\CYRV\CYRV\CYRE\CYRD\CYRE\CYRN\CYRI\CYRE}
  \renewcommand{\conclusionname}{\CYRZ\CYRA\CYRK\CYRL\CYRYU\CYRCH\CYRE\CYRN\CYRI\CYRE}
  \renewcommand{\bibname}{\CYRS\CYRP\CYRI\CYRS\CYRO\CYRK\ \CYRI\CYRS\CYRP\CYRO\CYRL\CYRSFTSN\CYRZ\CYRO\CYRV\CYRA\CYRN\CYRN\CYRERY\CYRH\ \CYRI\CYRS\CYRT\CYRO\CYRCH\CYRN\CYRI\CYRK\CYRO\CYRV}
  \renewcommand{\appendixname}{\CYRP\CYRR\CYRI\CYRL\CYRO\CYRZH\CYRE\CYRN\CYRI\CYRE}
  \renewcommand{\figurename}{\CYRR\cyri\cyrs\cyru\cyrn\cyro\cyrk}
  \renewcommand{\tablename}{\CYRT\cyra\cyrb\cyrl\cyri\cyrc\cyra}
}

\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{2}

\renewcommand{\tocprethechapter}{}
\renewcommand{\tocpostthechapter}{~}
\renewcommand{\prethechapter}{}
\renewcommand{\postthechapter}{~}
\renewcommand{\tocprethesection}{}
\renewcommand{\tocpostthesection}{~}
\renewcommand{\prethesection}{}
\renewcommand{\postthesection}{~}
\renewcommand{\tocprethesubsection}{}
\renewcommand{\tocpostthesubsection}{~}
\renewcommand{\prethesubsection}{}
\renewcommand{\postthesubsection}{~}
\renewcommand{\tocprethesubsubsection}{}
\renewcommand{\tocpostthesubsubsection}{~}
\renewcommand{\prethesubsubsection}{}
\renewcommand{\postthesubsubsection}{~}
\renewcommand{\tocpretheappendix}{\appendixname~}
\renewcommand{\tocposttheappendix}{.~}
\renewcommand{\pretheappendix}{\appendixname~}
\renewcommand{\posttheappendix}{\\}

\if@usedotsinheaders
  \renewcommand{\tocpostthechapter}{.~}
  \renewcommand{\postthechapter}{.~}
  \renewcommand{\tocpostthesection}{.~}
  \renewcommand{\postthesection}{.~}
  \renewcommand{\tocpostthesubsection}{.~}
  \renewcommand{\postthesubsection}{.~}
  \renewcommand{\tocpostthesubsubsection}{.~}
  \renewcommand{\postthesubsubsection}{.~}
\fi

\renewcommand\floatpagefraction{0.9}
\renewcommand\topfraction{0.9}
\renewcommand\bottomfraction{0.9}
\renewcommand\textfraction{0.1}
\setcounter{totalnumber}{64}
\setcounter{topnumber}{64}
\setcounter{bottomnumber}{64}

\captionsetup{singlelinecheck=false}
\captionsetup[figure]{%
  labelsep=period,
  justification=centering}
\captionsetup[table]{%
  labelsep=period,
  justification=raggedleft}
\floatname{figure}{\CYRR\cyri\cyrs\cyru\cyrn\cyro\cyrk}
\floatname{table}{\CYRT\cyra\cyrb\cyrl\cyri\cyrc\cyra}

% Workaround for disser-1.2.0 `headcenter` pagestyle options
% Custom page numbering style

\usepackage{fancyhdr}
\setlength{\headheight}{15pt}

\pagestyle{fancy}
\chapterpagestyle{fancy}
\renewcommand{\chaptermark}[1]{ \markboth{#1}{} }
\renewcommand{\sectionmark}[1]{ \markboth{#1}{} }

\fancyhf{}
\fancyhead[LE,RO]{\thepage}
% \fancyfoot[LE,RO]{\thepage}
% \fancyhead[R]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\fancypagestyle{plain}{
  \fancyhf{}
  \fancyhead[LE,RO]{\thepage}
%  \fancyfoot[LE,RO]{\thepage}
%  \fancyhead[R]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

% Workaround for new babel-russian conventions for alphabetic counters
\newcommand{\@Asbuk}{\russian@Alph}
\newcommand{\@asbuk}{\russian@alph}

\def\logo#1{\gdef\@logo{#1}}\logo{}

}
}
