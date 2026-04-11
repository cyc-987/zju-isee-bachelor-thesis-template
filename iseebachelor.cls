\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iseebachelor}[2026/03/06 ZJU bachelor final thesis class]
%-----------------------------------------------------------------
% load class options
%-----------------------------------------------------------------
\RequirePackage{ifthen}
% 控制完全体/仅毕业论文，默认为仅毕业论文
\newboolean{myfull}
\setboolean{myfull}{false}
\DeclareOption{final}{\setboolean{myfull}{true}}
\DeclareOption{thesisonly}{\setboolean{myfull}{false}}
% 控制是否为盲审模式
\newboolean{myblind}
\setboolean{myblind}{false}
\DeclareOption{blind}{\setboolean{myblind}{true}}
\DeclareOption{noblind}{\setboolean{myblind}{false}}
% other options pass through to ctexart
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax
\LoadClass{ctexart}
%-----------------------------------------------------------------
% import packages
%-----------------------------------------------------------------
\RequirePackage{ifthen}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{setspace}
\RequirePackage{calc}
\RequirePackage{indentfirst}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{subfigure}
\RequirePackage{caption}
\RequirePackage{float}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{array}
\RequirePackage{enumerate}
\RequirePackage{enumitem}
\RequirePackage{caption}
\RequirePackage{amsmath}
\RequirePackage{indentfirst}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{chapterbib}
\RequirePackage[sort&compress]{gbt7714}
\RequirePackage{fontspec}
\RequirePackage{tabularx}
\RequirePackage{amssymb}
\RequirePackage{pdfpages}
\RequirePackage{xfp}
\RequirePackage{multido}
\RequirePackage{makecell}
%-----------------------------------------------------------------
% format settings
%-----------------------------------------------------------------
% 页边距
\geometry{top=25.4mm,bottom=25.4mm,left=31.7mm,right=31.7mm}
% 首行缩进
\setlength{\parindent}{2em}
% 全局行距1.5
\onehalfspacing
% 字体族
\setmainfont{Times New Roman}
% \defaultfontfeatures{Path=assets/fonts/}
\setCJKmainfont[Path=assets/fonts/, AutoFakeBold={5}, AutoFakeSlant=0.2]{STFangsong.ttf} % 主要字体为华文仿宋
\setCJKfamilyfont{simhei}{SimHei.ttf}[Path=assets/fonts/, AutoFakeBold={4}, AutoFakeSlant=0.2] % 黑体family
\setCJKfamilyfont{simsun}{SimSun.ttc}[Path=assets/fonts/, AutoFakeBold={4}, AutoFakeSlant=0.2] % 宋体family
%-----------------------------------------------------------------
% pic/table/formula settings
%-----------------------------------------------------------------
% 图表设定
\renewcommand{\thetable}{\arabic{section}.\arabic{table}}
\renewcommand{\figurename}{\ptheadingfont{图}}
\renewcommand{\tablename}{\ptheadingfont{表}}
\captionsetup{labelsep=space}
\DeclareCaptionFont{zjuCapBase}{\CJKfamily{simsun}\zihao{5}\setstretch{1.5}}
\captionsetup{
  font=zjuCapBase,      % 整体五号宋体 + 1.5 行距
  labelfont=bf,         % “图/表 + 编号”加粗
  textfont=bf,  % 标题正文加粗
  labelsep=space,
  singlelinecheck=true  % 单行要保留居中
}
\RequirePackage[
  colorlinks=true,
  linkcolor=black,
  citecolor=black,
  CJKbookmarks=true,
  hypertexnames=false
]{hyperref}
\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}
% 公式设定
\numberwithin{equation}{section} % 将公式编号与章节关联
\renewcommand{\theequation}{\arabic{section}-\arabic{equation}}
\numberwithin{figure}{section} % 图的编号与章节关联
\numberwithin{table}{section}  % 表的编号与章节关联
% 设置 enumerate 的编号格式为 (1)
\renewcommand{\theenumi}{(\arabic{enumi})}
\renewcommand{\labelenumi}{\theenumi}
% ---- bibliography spacing (single space like Word) ----
\AtBeginDocument{%
  \let\origthebibliography\thebibliography
  \let\endorigthebibliography\endthebibliography
  \renewenvironment{thebibliography}[1]{%
    \origthebibliography{#1}%
    \setstretch{1.0}% 单倍行距（覆盖全局 onehalfspacing）
    \setlength{\itemsep}{0pt}%
    \setlength{\parsep}{0pt}%
    \setlength{\parskip}{0pt}%
    \setlength{\topsep}{0pt}%
  }{%
    \endorigthebibliography
  }%
}
%-----------------------------------------------------------------
% Syntactic sugar
%-----------------------------------------------------------------
\newcommand{\setfont}[2]{\zihao{#1}\linespread{\fpeval{(#2)*1.625/1.5}}\selectfont}
% 常用字体
\newcommand{\mainfont}[1]{{\setfont{-4}{1.5}{#1}}} % 正文：小四12磅仿宋1.5行距
\newcommand{\globalmainfont}{\setfont{-4}{1.5}}
\newcommand{\ptheadingfont}[1]{{\CJKfamily{simsun}\setfont{5}{1.5}\bfseries{#1}}} % 图表标题：五号宋体10.5磅加粗1.5行距
\newcommand{\ptmainfont}[1]{{\CJKfamily{simsun}\setfont{5}{1}{#1}}} % 图表正文：五号宋体10.5磅1行距
\newcommand{\headfont}[1]{{\CJKfamily{simsun}\setfont{-5}{1}{#1}}}
\newcommand{\footfont}[1]{{\setfont{-5}{1}{#1}}}
% 占位符
\newcommand{\bullshit}{{
尝试写一点正文，用于测试。尝试写一点正文，用于测试。尝试写一点正文，用于测试。尝试写一点正文，用于测试。尝试写一点正文，用于测试。尝试写一点正文，用于测试。尝试写一点正文，用于测试。

Test content. Test content. Test content. Test content. Test content. Test content. Test content. Test content. Test content. Test content. Test content. 
}}
% 空行
\newcommand{\blankline}[2]{
  {\setfont{#1}{#2}\par\noindent\mbox{}\par}
}
%-----------------------------------------------------------------
% head&foot settings
%-----------------------------------------------------------------
% 设置自定义页眉页脚样式
\setlength{\headheight}{12.64724pt}
\addtolength{\topmargin}{-0.64724pt}
\fancypagestyle{infoPage}{
    \fancyhf{}
    \pagenumbering{Roman}\setcounter{page}{3}
    \fancyhead[R]{\headfont \ProjectName}
    \fancyfoot[C]{\footfont \thepage}
}
\fancypagestyle{trinfoPage}{
    \fancyhf{}
    \fancyhead[R]{\headfont \ProjectName}
    \fancyfoot{} 
}
\fancypagestyle{indexPage}{
    \fancyhf{}
	\pagenumbering{Roman}\setcounter{page}{11}
	\fancyhead[RO]{\headfont \ProjectName}
    \fancyhead[LE]{\headfont{浙江大学本科生毕业论文（设计）}}
	\fancyfoot[C]{\footfont \thepage}
}
\fancypagestyle{mainPage}{
    \fancyhf{}
	\pagenumbering{arabic}
	\fancyhead[RO]{\headfont \ProjectName}
	\fancyhead[LE]{\headfont{浙江大学本科生毕业论文（设计）}}
    \fancyfoot[C]{\footfont \thepage}
}
\fancypagestyle{blankPage}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}% 取消页眉线
  \renewcommand{\footrulewidth}{0pt}% 取消页脚线
}
%-----------------------------------------------------------------
% style switcher & dual-TOC support (3in1 + thesis)
%-----------------------------------------------------------------
%----------------------
% heading settings
%----------------------
\newcommand{\ZJUSetupThesisHeading}{
    % 多级标题设置
    \setcounter{secnumdepth}{4}
    \titleformat{\section}[block]
        {\setfont{3}{1}\bfseries}
        {\arabic{section}}{1em}{}
    \titleformat{\subsection}[block]
        {\setfont{-3}{1}\bfseries}
        {\arabic{section}.\arabic{subsection}}{0.5em}{}
    \titleformat{\subsubsection}[block]
        {\setfont{4}{1}\bfseries}
        {\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}{0.5em}{}
    \titleformat{\paragraph}
        {\setfont{4}{1.5}\bfseries}
        {\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.\arabic{paragraph}}{0.5em}{}
    % 设置段间距
    \titlespacing{\section}{0pt}{8bp}{8bp}
    \titlespacing{\subsection}{0pt}{6pt}{6pt}
    \titlespacing{\subsubsection}{0pt}{6pt}{6pt}
    \titlespacing{\paragraph}{0pt}{0bp}{0bp}
}

\newcommand{\ZJUSetupAppendixHeading}{
    \setcounter{secnumdepth}{3}

    \titleformat{\section}[block]
        {\setfont{3}{1}\bfseries}
        {\thesection}{1em}{}
    
    \titleformat{\subsection}[block]
        {\setfont{-3}{1}\bfseries}
        {\thesubsection}{0.5em}{}
    
    \titleformat{\subsubsection}[block]
        {\setfont{4}{1}\bfseries}
        {\thesubsubsection}{0.5em}{}

    % 设置段间距
    \titlespacing{\section}{0pt}{8bp}{8bp}
    \titlespacing{\subsection}{0pt}{6pt}{6pt}
    \titlespacing{\subsubsection}{0pt}{6pt}{6pt}
}
%----------------------
% content settings
%----------------------
\newcommand{\ZJUSetupThesisTOCStyle}{
    \renewcommand{\contentsname}{\texorpdfstring{\setfont{3}{1}\bfseries\makebox[\linewidth][c]{目录}\vspace{0.5ex}}{目录}} 
    \setcounter{tocdepth}{3}
    \renewcommand{\thesection}{\CJKfamily{simhei}\arabic{section}}
    \renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
    \renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}
    \renewcommand{\theparagraph}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.\arabic{paragraph}}
    
    \titlecontents{thsection}[2em]
        {\CJKfamily{simhei}\bfseries\setfont{-4}{1.5}}
        {\contentslabel{2em}}{}
        {\titlerule*[0.5pc]{$\cdot$}\contentspage}
    \titlecontents{thsubsection}[2.5em]
        {\setfont{-4}{1.5}}
        {\contentslabel{1.5em}}{}
        {\titlerule*[0.5pc]{$\cdot$}\contentspage}
    \titlecontents{thsubsubsection}[4.5em]
        {\setfont{-4}{1.5}}
        {\contentslabel{2.5em}}{}
        {\titlerule*[0.5pc]{$\cdot$}\contentspage}
    \titlecontents{thparagraph}[5.5em]
        {\setfont{-4}{1.5}}
        {\contentslabel{3.5em}}{}
        {\titlerule*[0.5pc]{$\cdot$}\contentspage}
    % other contents
    \titlecontents{thsectionnoid}[0em]
        {\CJKfamily{simhei}\bfseries\setfont{-4}{1.5}}
        {}{}
        {\titlerule*[0.5pc]{$\cdot$}\contentspage}
    \titlecontents{thsectionnoiddot}[0em]
        {\CJKfamily{simhei}\bfseries\setfont{-4}{1.5}}% 格式
        {}{}% 有编号时的 label % 无编号时的 label
        {}% 标题前代码
}
%----------------------
% heading settings
%----------------------
\newcommand{\ZJUSetupThreeInOneHeading}{
    % 多级标题设置
    \setcounter{secnumdepth}{4}
    \titleformat{\section}[block]{\centering\setfont{3}{1}\bfseries}{\chinese{section}、}{0pt}{}
    \titleformat{\subsection}[block]{\setfont{3}{1}\bfseries}{\arabic{subsection}}{0.5em}{}
    \titleformat{\subsubsection}[block]{\setfont{-3}{1}\bfseries}{\arabic{subsection}.\arabic{subsubsection}}{0.5em}{}
    \titleformat{\paragraph}{\setfont{4}{1.5}\bfseries}{\arabic{subsection}.\arabic{subsubsection}.\arabic{paragraph}}{0.5em}{}
    % 设置段间距
    \titlespacing{\section}{0pt}{12pt}{6pt}
    \titlespacing{\subsection}{0pt}{8bp}{8bp}
    \titlespacing{\subsubsection}{0pt}{7.5bp}{7.5bp}
    \titlespacing{\paragraph}{0pt}{0bp}{0bp}
}
%----------------------
% content settings
%----------------------
\newcommand{\ZJUSetupThreeInOneTOCStyle}{
    % content settings
    \renewcommand{\contentsname}{\setfont{3}{2}\bfseries\centering 目录} 
    \setcounter{tocdepth}{1}
    \renewcommand{\thesection}{\CJKfamily{simhei}\chinese{section}、}
    \renewcommand{\thesubsection}{\arabic{subsection}}
    \renewcommand{\thesubsubsection}{\arabic{subsection}.\arabic{subsubsection}}
    \renewcommand{\theparagraph}{\arabic{subsection}.\arabic{subsubsection}.\arabic{paragraph}}
    
    \titlecontents{trsection}[2em]
        {\CJKfamily{simhei}\bfseries\setfont{-4}{1.5}}
        {\contentslabel{2em}}{}{\titlerule*[0.5pc]{$\cdot$}\contentspage}
    \titlecontents{trsubsection}[2.5em]
        {\setfont{-4}{1.5}}{\contentslabel{1em}}{}
        {\titlerule*[0.5pc]{$\cdot$}\contentspage}
    \titlecontents{trsubsubsection}[4.5em]
        {\setfont{-4}{1.5}}{\contentslabel{1.83em}}{}
        {\titlerule*[0.5pc]{$\cdot$}\contentspage}
    \titlecontents{trparagraph}[5.5em]{\setfont{-4}{1.5}}
        {\contentslabel{2.67em}}{}
        {\titlerule*[0.5pc]{$\cdot$}\contentspage}
    % other contents
    \titlecontents{trsectionnoiddot}[0em]
        {\CJKfamily{simhei}\bfseries\setfont{-4}{1.5}}{}{}{}
}

\makeatletter
% public environment: compile 3-in-1 part with its own heading + toc style
\newcommand{\ZJUStartThreeInOnePart}{
    \ZJUSetupThreeInOneHeading
    \ZJUSetupThreeInOneTOCStyle
    % float/equation numbering like isee3in1
    \renewcommand{\thetable}{\arabic{subsection}.\arabic{table}}
    \numberwithin{equation}{subsection}
    \numberwithin{figure}{subsection}
    \numberwithin{table}{subsection}
    % reset counters so 3-in-1 starts from 1
    \setcounter{section}{0}\setcounter{subsection}{0}\setcounter{subsubsection}{0}\setcounter{paragraph}{0}%
    \setcounter{figure}{0}\setcounter{table}{0}\setcounter{equation}{0}%
}
\newcommand{\ZJUStopThreeInOnePart}{
    % restore thesis numbering
    \renewcommand{\thetable}{\arabic{section}.\arabic{table}}
    \numberwithin{equation}{section}
    \renewcommand{\theequation}{\arabic{section}-\arabic{equation}}
    \numberwithin{figure}{section}
    \numberwithin{table}{section}
    \ZJUSetupThesisHeading
    \ZJUSetupThesisTOCStyle
}
\newenvironment{ThreeInOnePart}{\ZJUStartThreeInOnePart}{\ZJUStopThreeInOnePart}

% print a single TOC page but with two styles
\newcommand{\ZJUPrintCombinedTOC}{
    \phantomsection
    \pdfbookmark[0]{目录}{toc}
    \section*{\contentsname}
    % 第一部分：毕业论文目录
    \begingroup
        \setcounter{tocdepth}{3}
        \ZJUSetupThesisTOCStyle
        \printcontents[thesis]{th}{1}{}
    \endgroup
    
    % 第二部分：三合一目录
    \begingroup
        \vspace{0.5ex}
        \setcounter{tocdepth}{3}
        \ZJUSetupThreeInOneTOCStyle
        \printcontents[threeinone]{tr}{1}{}
    \endgroup
}
\makeatother
%-----------------------------------------------------------------
% cover
%-----------------------------------------------------------------
\newcommand{\makecover}{
    \thispagestyle{empty}
    
    \begin{flushright}
      \CJKfamily{simsun}\bfseries\setfont{5}{1.5} 涉密论文 $\square$ ~~ 公开论文 $\square$ \multido{}{3}{\quad}
    \end{flushright}
    
    \blankline{5}{1.5}
    
    \begin{center}
        \includegraphics[width=0.6\paperwidth]{assets/figs/heading.png}
    \end{center}
    
    \blankline{5}{1.5}
    \blankline{-6}{1.5}
    
    \begin{center}
        \zihao{1} \setlength{\baselineskip}{20pt} 
        \CJKfamily{simhei} \bfseries
          本~科~生~毕~业~论~文~（设计）
    \end{center}
    
    \blankline{-6}{1.5}
    \begin{center}
        \includegraphics[width=0.15\paperwidth]{assets/figs/logo.png}
    \end{center}
    % \blankline{-6}{1}

    \newcommand{\infotext}[1]{{\setfont{3}{1.5}\bfseries {##1}}}
    \newcommand{\infotextnobf}[1]{{\setfont{3}{1.5}\selectfont {##1}}}
    \begin{center}
        \zihao{3}
        \makebox[2.5em][l]{\infotext{题目}}\underline{\makebox[18.5em][c]{\infotextnobf{\ProjectName}}} \\
        % 如果题目一行放不下启用下面这行，把上面一行注释掉
        % \makebox[2.5em][l]{\infotext{题目}}\underline{\parbox[c]{18.5em}{\centering \infotextnobf{\ProjectName}}} \\
        \blankline{2}{1}
        \blankline{2}{1}
        \makebox[5.5em][l]{\infotext{姓名与学号}}\underline{\makebox[15.5em][c]{\infotextnobf{\ifthenelse{\boolean{myblind}}{}{\StudentName\ \StudentID}}}} \\[16pt]
        \makebox[5.5em][l]{\infotext{指导教师}}\underline{\makebox[15.5em][c]{\infotextnobf{\ifthenelse{\boolean{myblind}}{}{\Supervisor}}}} \\[16pt]
        \makebox[5.5em][l]{\infotext{年级与专业}}\underline{\makebox[15.5em][c]{\infotextnobf{\ifthenelse{\boolean{myblind}}{}{\Grade\ \Major}}}} \\[16pt]
        \makebox[5.5em][l]{\infotext{所在学院}}\underline{\makebox[15.5em][c]{\infotextnobf{\ifthenelse{\boolean{myblind}}{}{\College}}}} \\[16pt]
        \blankline{-3}{1.5}
        \makebox[5.5em][l]{\infotext{提交日期}}\underline{\makebox[15.5em][c]{\infotextnobf{\today}}} \\
    \end{center}
    
    \clearpage
}
%-----------------------------------------------------------------
% environment settings
%-----------------------------------------------------------------
\newenvironment{TranslationNoMiniToc}{%
  % 进入翻译部分：把 tocdepth 写进 .toc（对目录显示生效）
  \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}%
}{%
  % 离开翻译部分：恢复到 cls 里默认的 3
  \addtocontents{toc}{\protect\setcounter{tocdepth}{3}}%
}
\makeatletter
\renewcommand*\l@part[2]{%
  \addvspace{0.5ex}% 上间距
  \noindent{\setfont{4}{1.5}\bfseries #1}\par
  \addvspace{0.5ex}% 下间距
  % #2 是页码，这里不用 => 不显示页码
}
\def\ttll@sectionnoid{1}
\def\toclevel@sectionnoid{1}
\def\ttll@sectionnoiddot{1}
\def\toclevel@sectionnoiddot{1}
\makeatother