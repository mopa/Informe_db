%******************************************
% Informe Double Column Style
% Class File
% Version 1.0
%
% Author: Pablo M.
%
% This template has been based on:
% http://www.latextemplates.com/template/stylish-article
%
% License:
% CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)
%
%******************************************

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{informe_db}[20/02/2018, v1.0]
\RequirePackage{ifthen}
\RequirePackage{calc}
\AtEndOfClass{\RequirePackage{microtype}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*
\LoadClass{article}
\RequirePackage{ifpdf}      

%==========================================
%	FONTS
%==========================================
\RequirePackage[utf8]{inputenc}
\RequirePackage[english,spanish,es-noquoting]{babel}
\RequirePackage{fourier, helvet} 
\RequirePackage{eucal}

%==========================================
%	MATH
%==========================================
\RequirePackage{amsmath, amsthm, amssymb, bm, mathtools} 
\RequirePackage{manfnt} 
\RequirePackage{siunitx} 
\RequirePackage{cancel}

%==========================================
%	MARGINS	
%==========================================	  	  
\RequirePackage[%
left=2cm,%
right=2cm,%
top=2.25cm,%
bottom=2.25cm,%
headheight=11pt,%
letterpaper]{geometry}%
				
%========================================== 
%	CAPTIONS
%==========================================
\RequirePackage[figurename=Fig.]{caption}
\captionsetup{
  justification=raggedright,
  font={small,sf},
  labelfont=bf,
  figurewithin=section}

%==========================================
% OTHER PACKAGES
%==========================================
\RequirePackage{graphicx,xcolor}
\RequirePackage{booktabs}

%==========================================
% SOME OPTIONS FOR DOCUMENT
%==========================================
% Decimal as point
\spanishdecimal{.}

%==========================================
% COLUMNS
%==========================================
\setlength{\columnsep}{0.55cm} % Distance between the two columns of text
\setlength{\fboxrule}{0.75pt} % Width of the border around the abstract

%==========================================
% HYPERLINKS
%==========================================
\usepackage{hyperref} 
\hypersetup{hidelinks,colorlinks,breaklinks=true,urlcolor=color2,%
  citecolor=color1,linkcolor=color1,bookmarksopen=false,%
  pdftitle={Title},pdfauthor={Author}}

%========================================== 
%	PAGE HEADER
%========================================== 
\RequirePackage{fancyhdr}  
\RequirePackage{lastpage}  % Number of pages in the document
\pagestyle{fancy}          
% Headers
\lhead{}%
\chead{}%
\rhead{\small\sffamily\bfseries\@PaperTitle\  --- \thepage/\pageref{LastPage}}
% Footers
\lfoot{}%
\cfoot{}%
\rfoot{}%
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

%========================================== 
%	SECTION/SUBSECTION/PARAGRAPH SET-UP
%========================================== 
\RequirePackage[explicit]{titlesec}
\titleformat{\section}
  {\color{color1}\large\sffamily\bfseries}
  {}
  {0em}
  {\colorbox{color2!7}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\centering\arabic{section}. #1}}}
  []
\titleformat{name=\section,numberless}
  {\color{color1}\large\sffamily\bfseries}
  {}
  {0em}
  {\colorbox{color2!7}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\centering#1}}}
  []  
\titleformat{\subsection}
  {\color{color1}\sffamily\bfseries}
  {\thesubsection}
  {0.5em}
  {#1}
  []
\titleformat{\subsubsection}
  {\sffamily\small\bfseries}
  {\thesubsubsection}
  {0.5em}
  {#1}
  []    
\titleformat{\paragraph}[runin]
  {\sffamily\small\bfseries}
  {}
  {0em}
  {#1} 
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{0pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{0pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{10pt}

%========================================== 
%	TABLEOFCONTENTS SET-UP
%========================================== 
\newlength{\tocsep} 
% Sets the indentation of the sections in TOC
\setlength\tocsep{1.5pc}
% Three levels in TOC
\setcounter{tocdepth}{1} 

\usepackage{titletoc}
\contentsmargin{0cm}
\titlecontents{section}[\tocsep]
  {\addvspace{4pt}\small\bfseries\sffamily}
  {\contentslabel[\thecontentslabel]{\tocsep}}
  {}
  {\hfill\thecontentspage}
  []
\titlecontents{subsection}[\tocsep]
  {\addvspace{2pt}\sffamily}
  {\contentslabel[\thecontentslabel]{\tocsep}}
  {}
  {\ \titlerule*[.5pc]{.}\ \thecontentspage}
  []
\titlecontents*{subsubsection}[\tocsep]
  {\footnotesize\sffamily}
  {}
  {}
  {}
  [\ \textbullet\ ]  


%========================================== 
%	LIST CONTROL
%==========================================   
\RequirePackage{enumitem}
% Remove spacing between items in lists (enumerate, itemize)
%\setlist{nolistsep}

%========================================== 
%	ABSTRACT+AUTHOR FRAME
%==========================================   
\newcommand{\PaperTitle}[1]{\def\@PaperTitle{#1}}
\newcommand{\Authors}[1]{\def\@Authors{#1}}
\newcommand{\Abstract}[1]{\def\@Abstract{#1}}


% ---------------------------------------------------------------------

\renewcommand{\@maketitle}{%
\twocolumn[{%
\thispagestyle{empty}%
\vskip-36pt%
{\raggedleft\small \logo \par}%
\vskip20pt%
{\raggedright\color{color1}\sffamily\bfseries\fontsize{20}{25}\selectfont \@PaperTitle\par}%
\vskip10pt%
{\raggedright\color{color1}\sffamily\fontsize{10}{16}\selectfont  \@Authors\par}%
\vskip18pt%
\fcolorbox{color1}{white}{%
\parbox{\textwidth-2\fboxsep-2\fboxrule}{\centering%
\colorbox{color2!7}{%
\parbox{\textwidth-4\fboxsep-2\fboxrule}{%
\ifx\@empty%
\sffamily\textbf{\abstractname}\\\@Abstract%
\else%
\sffamily\textbf{\abstractname}\\\@Abstract\\[4pt]%
%
\fi%
}%
}%
}%
}%
\vskip25pt%
}]%
}

%========================================== 
%	REFERENCES
%==========================================   

% Remove brackets from numbering in List of References
\renewcommand{\@biblabel}[1]{\bfseries\color{color1}\textsuperscript{[#1]}}
%\setlength{\bibitemsep}{0cm}
\let\oldbibliography\thebibliography
\renewcommand{\thebibliography}[1]{%
\addcontentsline{toc}{section}{\refname}%
\oldbibliography{#1}%
\setlength\itemsep{0pt}}%


