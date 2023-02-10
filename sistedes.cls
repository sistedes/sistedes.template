% SISTEDES DOCUMENT CLASS -- version 1.0 (07-Feb-2023)
% Sistedes template for LaTeX2e, based on Lecture Notes in Computer Science
%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{sistedes}[2023/02/07 v1.0
^^J LaTeX document class for the Sistedes Digital Library]

\LoadClass[twoside, runningheads]{llncs}

% Add some translations when babel in Spanish is loaded
\AtBeginDocument{%
\makeatletter%
\@ifpackagewith{babel}{spanish}%
{%
 \input{doclicense-spanish.ldf}% Make make 'doclicense' load the Spanish strings
 \def\conjecturename{Hip\'otesis}%
 \def\corollaryname{Corolario}%
 \def\definitionname{Definici\'on}%
 \def\examplename{Ejemplo}%
 \def\exercisename{Ejercicio}%
 \def\lemmaname{Lema}%
 \def\notename{Nota}%
 \def\problemname{Problema}%
 \def\proofname{Demostración}%
 \def\propertyname{Propiedad}%
 \def\propositionname{Proposici\'on}%
 \def\questionname{Pregunta}%
 \def\remarkname{Acotaci\'on}%
 \def\solutionname{Soluci\'on}%
 \def\theoremname{Teorema}%
}{}
\makeatother%
}

% Setup hyperref, so that metadata is correctly set
% Produce PDF/A documents, since these docuemtns are meant to be archived 
% in the Sistedes digital library
% Also \clearheadinfo needs to be overriden, so that title and authors are
% set before they are cleared
\RequirePackage[rgb,hyperref,usenames,dvipsnames]{xcolor}
\RequirePackage{hyperxmp}
\RequirePackage[pdfa,pdfapart=1,pdfaconformance=b]{hyperref}
\let\original@clearheadinfo\clearheadinfo
\def\clearheadinfo{%
  \def\thanks##1{}%
  \let\sistedes@title\@title%
  \def\and{\unskip, }%
  \def\inst##1{}%
  \def\orcidID##1{}% 
  \let\sistedes@author\@author
  \hypersetup{pdftitle={\sistedes@title},pdfauthor={\sistedes@author}}%
  \original@clearheadinfo%
}

% Configure watermark with the license
\RequirePackage[type={CC}, modifier={by-nc-nd}, version={4.0}]{doclicense}
\RequirePackage{draftwatermark}
\AtBeginDocument{
\SetWatermarkVerCenter{\dimexpr\paperheight-\baselineskip-2em}
\SetWatermarkAngle{0}
\SetWatermarkColor{gray}
\SetWatermarkText{
\begin{minipage}{\dimexpr\paperwidth-2em}\scriptsize\fontfamily{phv}\selectfont
\mbox{\doclicenseLongText}\hfill\doclicenseImage[imagewidth=7em]
\end{minipage}}}

% Macros for relevant papers
\providecommand{\publishedin}[1]{
\par\noindent\textbf{Published in:}\enspace\ignorespaces#1}%

\providecommand{\DOI}[1]{
\par\noindent\textbf{DOI:}\enspace\ignorespaces\url{#1}}%

\providecommand{\impact}[1]{
\par\noindent\textbf{Impact Factor:}\enspace\ignorespaces#1}%

% Other imports
\RequirePackage{lipsum}


