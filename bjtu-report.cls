%%
%% This is file `bjtu-report.cls'
%%
%% ------------------------------------------------------------------------
%% Copyright (C) 2022 Q.Tang
%% 
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%% 
%%     http://www.apache.org/licenses/LICENSE-2.0
%% 
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%% ------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bjtu-report}[2022/09/17]
\def\version{1.1}
\LoadClass[a4paper,zihao=-4,twoside,hyperref,openright]{ctexart}
%========================================================================%
% 基本宏包
%========================================================================%
\RequirePackage{caption}
\RequirePackage{mathptmx}
\RequirePackage{changepage}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{tabularx}
\RequirePackage{subcaption}
\RequirePackage{pgfplots}
\RequirePackage{tikz}
\RequirePackage{multicol}
\RequirePackage{setspace}
\RequirePackage{titletoc}
\RequirePackage{fontspec}
\RequirePackage[colorlinks,linkcolor=black,anchorcolor=black,citecolor=black,urlcolor=black]{hyperref}
\RequirePackage{datetime}
\RequirePackage{etoolbox}
\RequirePackage{booktabs}
\RequirePackage{floatrow}
\RequirePackage{appendix}
\RequirePackage{enumitem}
\RequirePackage[backend=biber,style=gb7714-2015]{biblatex}
\RequirePackage{underscore}
\RequirePackage{listings}
\RequirePackage{color}
\RequirePackage{multirow}
\RequirePackage{float}
\RequirePackage[linesnumbered,ruled,vlined]{algorithm2e}
\RequirePackage{algpseudocode}
\RequirePackage{bm}
\RequirePackage{textcomp}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{longtable}
\RequirePackage[normalem]{ulem}
\RequirePackage{ragged2e}
\RequirePackage{blindtext}
\RequirePackage{adjustbox}
\RequirePackage{amsfonts}
\RequirePackage{tcolorbox,tabu}
\RequirePackage{indentfirst} 
\RequirePackage{array}

\tcbuselibrary{listings,theorems,skins}

\usetikzlibrary{calc,backgrounds}
                                          
%========================================================================%
% 参考北京交通大学本科毕业设计（论文）格式要求
%========================================================================%
\setCJKfamilyfont{hwzs}{stzhongs.ttf}[Path=fonts/]
\newcommand{\hwzs}{\CJKfamily{hwzs}}
\setCJKfamilyfont{bjtusong}{simsun.ttc}[Path=fonts/, AutoFakeBold=2.5]
\newcommand*{\bjtusongti}{\CJKfamily{bjtusong}}

\newfontfamily{\bjtueheiti}{simhei.ttf}[Path=fonts/]

\setCJKfamilyfont{bjtuhei}{simhei.ttf}[Path=fonts/, AutoFakeBold=2]
\newcommand*{\bjtuheiti}{\CJKfamily{bjtuhei}}
\newcommand*{\yearmonth}{\songti \zihao{-3} \the \year 年 \the \month 月}


\geometry{left=2.5cm,right=2.5cm,top=3.0cm,bottom=3.0cm,headheight=1.5cm,footskip=1.75cm}
\setmainfont{Times New Roman}
\linespread{1.4}\selectfont
\setlength{\baselineskip}{20pt}

\setlength{\parskip}{0.5em}
\setlength{\parindent}{2em} %2em代表首行缩进两个字符    

\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

\renewcommand{\arraystretch}{1.2}

\renewcommand{\captionfont}{\zihao{5}}
\renewcommand{\theequation}{\arabic{section}-\arabic{equation}}
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{section}-\arabic{table}}
\DeclareCaptionFont{bjtusongti}{\zihao{5}\bjtusongti}
\captionsetup{font=bjtusongti}

\DeclareFloatFont{bjtusongti}{\zihao{5}\bjtusongti}
\DeclareFloatVCode{figureafterfloat}{\vspace{-16pt}}
\DeclareFloatVCode{tableafterfloat}{\vspace{-4pt}}
\floatsetup[table]{font=bjtusongti,capposition=top,captionskip=2pt,postcode=tableafterfloat}
\floatsetup[figure]{font=bjtusongti,capposition=bottom,captionskip=4pt,postcode=figureafterfloat}

\ctexset{
    section = {
        name={,},
        number={\arabic {section}},
        beforeskip={-4pt},
        afterskip={18pt},
        nameformat={},
        titleformat={},
        format=\heiti\zihao{3},
    },
    subsection = {
        format=\raggedright\heiti\zihao{-3},
        beforeskip={24pt},
        afterskip={18pt},
    },
    subsubsection = {
        format=\raggedright\heiti\zihao{4},
        beforeskip={24pt},
        afterskip={18pt},
    },
}

\setlength{\itemsep}{100pt}
\captionsetup[table]{labelsep=space} % 表
\captionsetup[figure]{labelsep=space} % 图 

\let\oldequation=\equation
\let\endoldequation=\endequation
\renewenvironment{equation}{\vspace{-0.7cm}\begin{oldequation}}{\vspace{-0.3cm}\end{oldequation}\ignorespacesafterend}
%========================================================================%
\newcommand{\figcaption}[1]{\caption{图}{#1}}
%========================================================================%
% 目录格式
%========================================================================%
\makeatletter
\renewcommand\tableofcontents{%
    \section*{\makebox[\linewidth]{\zihao{-2} 目\hspace{2em}录}
        \@mkboth{\MakeUppercase \contentsname}{}}% ADDED
	\vspace{-0.5cm}
    \@starttoc{toc}%
    } 
\makeatother



\makeatletter
\renewcommand\contentspage[1][\MakeUppercase{\bjtueheiti \thecontentspage}]{%
  \hb@xt@\@pnumwidth{\hfil#1}%
  \hspace*{-\@pnumwidth}}
\makeatother


\titlecontents{part}[0em]{\vspace{0.2ex}}{\bjtueheiti \zihao{-4}\contentslabel{0em}}{\bjtueheiti \bjtuheiti\zihao{-4}}{\titlerule*[0.5pc]{.}\contentspage}[\vspace{0.2ex}]
% \contentsmargin{1em}
\titlecontents{section}[1.5em]{\vspace{0.3ex}}{\bjtuheiti \bjtueheiti \zihao{-4}\contentslabel{1.5em}}{\bjtuheiti \bjtueheiti \zihao{-4}}{\titlerule*[0.5pc]{.}\contentspage}[\vspace{0.15ex}]
\titlecontents{subsection}[3em]{\hspace{0em}}{\contentslabel{2.2em}}{\songti \zihao{-4}}{\titlerule*[0.5pc]{.}\contentspage}[\vspace{0ex}]
\titlecontents{subsubsection}[4.5em]{\hspace{0em}}{\contentslabel{2.9em}}{\songti \zihao{-4}}{\titlerule*[0.5pc]{.}\contentspage}[\vspace{0ex}]
%========================================================================%
% 页眉设置
%========================================================================%
\renewcommand{\sectionmark}[1]{\markboth{#1}{}}
\fancypagestyle{bjtufancy}{
	
	\fancyhead[CE,CO]{}
	\fancyhead[L]{\zihao{4}\hwzs \hspace*{0.5em}\scene}
	\fancyhead[R]{\zihao{4}\hwzs \leftmark\hspace*{0.5em}}
	\fancyfoot[CO,CE]{\zihao{5}\thepage}

	% Redefining headrule
	\makeatletter
	\renewcommand{\headrule}{\hrule height 1pt \vspace{1pt}\hrule height 2.5pt}
}

\fancypagestyle{bjtufancymain}{
	\fancyhead[R]{\zihao{4}\hwzs 正文\hspace*{0.5em}}
}

\fancypagestyle{bjtuempty}{
\fancyhead{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{bjtuclear}{
\fancyhead{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyfoot{}
}
\fancypagestyle{plain}{
\fancyhead{}
\fancyhead[CE]{\zihao{5}\hspace{2em}\scene}
\fancyhead[CO]{\zihao{5}\hspace{2em}\leftmark}
\fancyfoot[CO,CE]{\zihao{-5}\thepage}
\renewcommand{\headrulewidth}{0.4pt}
}
\renewcommand{\sectionmark}[1]{\markboth{#1}{}}
%========================================================================%
% 自定义内容
%========================================================================%
\renewcommand{\title}[1]{\renewcommand{\title}{#1}}
\newcommand{\englishtitle}[1]{\renewcommand{\englishtitle}{#1}}
\renewcommand{\author}[1]{\renewcommand{\author}{\songti\zihao{3}#1}}
\newcommand{\school}[1]{\renewcommand{\school}{\songti\zihao{3}#1}}
\newcommand{\laboratory}[1]{\renewcommand{\laboratory}{\songti\zihao{3}#1}}

\newcommand{\major}[1]{\renewcommand{\major}{\songti\zihao{3}#1}}
\newcommand{\studentNumber}[1]{\renewcommand{\studentNumber}{\zihao{3}#1}}
\newcommand{\advisor}[1]{\renewcommand{\advisor}{\songti\zihao{3}#1}}
\newcommand{\scene}[1]{\renewcommand{\scene}{\songti\zihao{3}#1}}
\newcommand{\repository}[1]{\renewcommand{\repository}{\songti\zihao{3}#1}}

\newtoggle{lablogo} 
\newcommand\laboratorylogo[1]{%
\global\toggletrue{lablogo}
\renewcommand{\laboratorylogo}{#1}
}


% 插入代码样式
\definecolor{gray}{rgb}{0.96,0.96,0.96}

\lstset{ %
  language=python,                % the language of the code
  basicstyle=\footnotesize,           % the size of the fonts that are used for the code
  numbers=left,                   % where to put the line-numbers
  columns=fixed, 
  numberstyle=\tiny\color{black},  % the style that is used for the line-numbers
  stepnumber=1,                   % the step between two line-numbers. If it's 1, each line 
                                  % will be numbered
  numbersep=5pt,                  % how far the line-numbers are from the code
  backgroundcolor=\color{gray},      % choose the background color. You must add \usepackage{color}
  showspaces=false,               % show spaces adding particular underscores
  showstringspaces=false,         % underline spaces within strings
  showtabs=false,                 % show tabs within strings adding particular underscores
  frame=single,,                 % adds a frame around the code
  frameround = tttt,
  framexleftmargin=3mm, 
  rulecolor=\color[RGB]{158,193,243},        % if not set, the frame-color may be changed on line-breaks 
  tabsize=2,                      % sets default tabsize to 2 spaces
  captionpos=b,                   % sets the caption-position to bottom
  breaklines=true,                % sets automatic line breaking
  extendedchars=false,   
  breakatwhitespace=false,        % sets if automatic breaks should only happen at whitespace
  title=\lstname,                   % show the filename of files included with \lstinputlisting;
                                  % also try caption instead of title
  keywordstyle=\color[RGB]{0,51,179},          % keyword style
  commentstyle=\color[RGB]{140,140,140},       % comment style
  stringstyle=\color[RGB]{6,125,23},         % string literal style
  identifierstyle=\color{black},
  escapeinside={\%*}{*)},            % if you want to add LaTeX within your code
  morekeywords={*,...}               % if you want to add more keywords to the set
}

\renewcommand{\algorithmicrequire}{\textbf{Input:}}
\renewcommand{\algorithmicensure}{\textbf{Output:}}


%========================================================================%
% 参考文献格式
%========================================================================%
\AtBeginBibliography{\zihao{5}}

\addbibresource[]{reference/bjtu-bachelor-thesis-reference.bib}

\defbibheading{bjtuheading}[\zihao{-2}参考文献]{%
  \centering\section*{#1}
  \markboth{参考文献}{}}
 
   \renewenvironment{thebibliography}[1]
{\zihao{5}
	{\centering\section*{\heiti \bibname}}
	\@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
	\addcontentsline{toc}{section}{\heiti 参考文献}
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\setlength{\parsep}{1mm}
		\setlength{\labelsep}{0.5em}
		\setlength{\itemsep}{0.05pc}
		\setlength{\listparindent}{0in}
		\setlength{\itemindent}{0in}
		\setlength{\rightmargin}{0in}
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\sloppy
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m}
{\def\@noitemerr
	{\@latex@warning{Empty `thebibliography' environment}}%
	\endlist}
	 


%========================================================================%
% 前置部分命令
%========================================================================%
% 设置有序和无序列表行距和留白
\setlist[itemize]{noitemsep, topsep=0pt}
\setlist[enumerate]{noitemsep, topsep=0pt}

% 设置全局样式
\let\cleardoublepage=\clearpage
\makeatletter
\let\ps@plain\ps@fancy
\patchcmd{\section}{plain}{bjtufancy}{}{}
\makeatother

\newenvironment{thecenter}
	{\begin{center}\vspace{24pt}\zihao{-2}\heiti}
	{\vspace{18pt}\end{center}}


\newcommand{\makecover}{
	\thispagestyle{bjtuclear}
	
	\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}
	
	\begin{center}

	\begin{tikzpicture}[remember picture,overlay]
	    \begin{pgfonlayer}{background}
	    \node at ($(current page.west) +(2.4in,4.23in)$) {%
    	\includegraphics[width=8cm]{./vi/logo.png}};
	    \ifboolexpr{togl{lablogo}}{
    	\node at ($(current page.west) +(6.4in,4.23in)$) {%
    	\includegraphics[width=0.17\textwidth]{\laboratorylogo}};}{}
    	\node at ($(current page.east) +(0in,0in)$) {%
    	\includegraphics[width=0.8\textwidth]{./vi/cover.png}};
    	\node at ($(current page.south) +(0.7in,1.2in)$) {%
    	\includegraphics[width=1.65\textwidth]{./vi/background.png}};
    	\end{pgfonlayer}
    \end{tikzpicture}
    
	\vspace*{7cm}
	\makeatletter
	\textsl{\Large Beijing Jiaotong University}\\[0.5cm]
	\textsl{\large \laboratory}\\[0.5cm]
	
	\HRule \\[0.6cm]
	\text{ \huge \bfseries \title}\\[0.2cm] 
	\HRule \\[1.5cm]
	
	\begin{table}[!htbp] 
		\begin{tabular}{L{0.4\linewidth}R{0.4\linewidth}}
			\large\emph{Author:} & \large\emph{Supervisor:} \\[0.4cm]
			\large \author & \large \advisor \\
		\end{tabular}
	\end{table}
	
	\vspace*{4cm}
	
	\makeatother
	{\large \scene}\\[0.5cm]
	{\large \emph{\repository}}\\[0.5cm]
	{\large \yearmonth}\\[2cm] 
	\vfill 


	\end{center}
	
	\newpage
}

\newcommand{\bjtuclpage}{
	\thispagestyle{bjtuclear}
	\mbox{}
	\newpage
}
\newcommand{\bjtufanpage}{
	\thispagestyle{bjtufancy}
	\mbox{}
	\newpage
}

%重新定义附录环境
\renewenvironment{appendix}{
	\thispagestyle{bjtuempty}
	\section*{\makebox[\linewidth]{\zihao{-2}附\hspace{2em}录}}
	\markboth{附录}{}
	\addcontentsline{toc}{part}{附\hspace{2em}录}
}{}

%% 如果插入的图片没有指定扩展名，那么依次搜索下面的扩展名所对应的文件
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}

%========================================================================%
% 结束
%========================================================================%
