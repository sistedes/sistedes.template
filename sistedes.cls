% SISTEDES DOCUMENT CLASS -- version 1.3 (22-Jan-2024)
% Sistedes template for LaTeX2e, based on Lecture Notes in Computer Science
%
% Changelog:
%
% * v1.3 (22-Jan-2024):
%   - Reorder hyperxmp and hyperref imports due to breaking changes 
%     in hyperxmp 5.12
% * v1.2 (09-Nov-2023):
%   - Remove duplicate RequirePackage{hyperref}
%   - Ensure compatibility with llncs.cls 2.23
%   - Add \ackname and \discintname translations
% * v1.1 (14-Jun-2023):
%   - Add an embedded version of `orcidlink`
% * v1.0 (07-Feb-2023):
%   - Initial version

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{sistedes}[2024/01/22 v1.3
^^J LaTeX document class for the Sistedes Digital Library]

\LoadClass[twoside, runningheads]{llncs}

% Add some translations when babel in Spanish is loaded
\AtBeginDocument{%
\makeatletter%
\@ifpackagewith{babel}{spanish}%
{%
 \input{doclicense-spanish.ldf}% Make make 'doclicense' load the Spanish strings
 \def\ackname{Agradecimientos}%
 \def\discintname{Declaración de intereses}%
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
% Also \author and \title need to be overriden, so that they can be stored
% before they are cleared, and as such can be further reused
\RequirePackage[rgb,hyperref,usenames,dvipsnames,table]{xcolor}
\RequirePackage[pdfa]{hyperref}
\RequirePackage{hyperxmp}
\let\original@title\title
\renewcommand{\title}[1]{%
  \begingroup
  \original@title{#1}%
  \def\thanks##1{}%
  \def\sistedes@title{#1}%
  \hypersetup{pdftitle={\sistedes@title}}%
  \endgroup
}

\let\original@author\author
\renewcommand{\author}[1]{%
  \begingroup
  \original@author{#1}%
  \def\and{\unskip, }%
  \def\inst##1{}%
  \def\orcidID##1{}% 
  \def\sistedes@author{#1}%
  \hypersetup{pdfauthor={\sistedes@author}}%
  \endgroup
}

\let\original@maketitle\maketitle
\def\maketitle{%
  \original@maketitle
  \let\original@keywords\keywords
  \renewcommand{\keywords}[1]{%
    \begingroup
    \original@keywords{##1}%
    \def\and{\unskip, }%
    \def\sistedes@keywords{##1}%
    \hypersetup{pdfkeywords={\sistedes@keywords}}%
    \endgroup
  }
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

% Below we include a stripped and modified version of `orcidlink.sty` as available at
% https://github.com/duetosymmetry/orcidlink-LaTeX-command
% Copyright (C) 2020 by Leo C. Stein <leo.stein@gmail.com>
% `orcidlink` may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% (See http://www.latex-project.org/lppl.txt)
%
% We include this embedded version of `orcidlink` (rather than importing it) 
% to support old installations of LaTeX, since this package was made available
% in CTAN in 2020-2021
\RequirePackage{tikz}

\usetikzlibrary{svg.path}

\definecolor{orcidlogocol}{HTML}{A6CE39}
\tikzset{
  orcidlogo/.pic={
    \fill[orcidlogocol] svg{M256,128c0,70.7-57.3,128-128,128C57.3,256,0,198.7,0,128C0,57.3,57.3,0,128,0C198.7,0,256,57.3,256,128z};
    \fill[white] svg{M86.3,186.2H70.9V79.1h15.4v48.4V186.2z}
                 svg{M108.9,79.1h41.6c39.6,0,57,28.3,57,53.6c0,27.5-21.5,53.6-56.8,53.6h-41.8V79.1z M124.3,172.4h24.5c34.9,0,42.9-26.5,42.9-39.7c0-21.5-13.7-39.7-43.7-39.7h-23.7V172.4z}
                 svg{M88.7,56.8c0,5.5-4.5,10.1-10.1,10.1c-5.6,0-10.1-4.6-10.1-10.1c0-5.6,4.5-10.1,10.1-10.1C84.2,46.7,88.7,51.3,88.7,56.8z};
  }
}
\newcommand{\@OrigHeightRecip}{0.00390625}
\newlength{\@curXheight}
% We declare \orcidID{...} rather than \orcidlink{...} for backwards
% compatiblity of the sistedes.cls class
\DeclareRobustCommand\orcidID[1]{%
\texorpdfstring{%
\setlength{\@curXheight}{\fontcharht\font`X}%
\href{https://orcid.org/#1}{\XeTeXLinkBox{\mbox{%
\begin{tikzpicture}[yscale=-\@OrigHeightRecip*\@curXheight,
xscale=\@OrigHeightRecip*\@curXheight,transform shape]
\pic{orcidlogo};
\end{tikzpicture}%
}}}}{}}
% End of `orcidlink`
