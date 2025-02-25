\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{custom}[2024/02/17 Custom class for weekly reports]

% Define options for report and slide
\newif\if@isreport
\newif\if@isslide
\DeclareOption{report}{\@isreporttrue\@isslidefalse}
\DeclareOption{slide}{\@isslidetrue\@isreportfalse}
% \ExecuteOptions{report}
\ProcessOptions\relax

% Common packages for both report and slide

\if@isreport
\LoadClass{article}
% Report-specific packages

\RequirePackage{graphicx}
\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  linkcolor=blue,
  filecolor=blue,
  urlcolor=blue,
  citecolor=blue
}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{booktabs}
\RequirePackage{subcaption}
\RequirePackage{multicol}
\RequirePackage{listings}
\RequirePackage{multirow}
\RequirePackage{tikz}

\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{enumitem}
\RequirePackage{titling}
\RequirePackage{titlesec}

\RequirePackage{ctex}
% Choose Chinese fonts
\setCJKmainfont{Songti SC} % Main Chinese font (Songti)
\setCJKsansfont{Lantinghei TC} % Sans-serif Chinese font (Heiti)
% \setCJKmonofont{Maple Mono NF CN} % Monospaced Chinese font (Fangsong)

%% Customize the title format
\titleformat{\section}
{\normalfont\Large\bfseries}{\thesection}{1em}{}

% Settings specific to report
\geometry{margin=0.5in, paperheight=11in, paperwidth=8.5in} % Set paper size

% Define default title and droptitle
\title{周报-向嘉豪(\today)}
% Customized maketitle command
\renewcommand{\maketitle}{
  \begin{center}
    \LARGE\bfseries\thetitle
  \end{center}
}

\fi

\if@isslide
\LoadClass{beamer}
% Slide-specific packages
\RequirePackage{inputenc}
\RequirePackage{tabularx}
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{booktabs}
\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  linkcolor=blue,
  filecolor=magenta,
  urlcolor=cyan,
  pdftitle={Weekly Report},
  pdfpagemode=FullScreen,
}
\RequirePackage{subcaption}
\RequirePackage{multicol}
\RequirePackage{listings}
\RequirePackage{multirow}
\RequirePackage{tikz}

%% font settings
\RequirePackage{ctex}

% Font configuration for Chinese
\setCJKmainfont{Maple Mono NF CN}
\setCJKsansfont{Maple Mono NF CN}
\setCJKmonofont{Maple Mono NF CN}

% % the english font setting
% \setmainfont{Maple Mono NF CN}
% \setsansfont{Maple Mono NF CN}
% \setmonofont{Maple Mono NF CN}

% Beamer settings
\usetheme{Madrid}
\usecolortheme{seahorse}
\setbeamertemplate{caption}[numbered]
% Show navigation symbols
\setbeamertemplate{navigation symbols}{}  % Remove this line if it exists
\setbeamertemplate{navigation symbols visible}{} % Add this line to show navigation symbols

% Custom block colors
\setbeamercolor{block title}{bg=blue!30,fg=black}
\setbeamercolor{block body}{bg=blue!10,fg=black}
\setbeamercolor{alertblock title}{bg=red!50,fg=black}
\setbeamercolor{alertblock body}{bg=red!20,fg=black}

% Default title settings

\date{\today}
\fi

\endinput