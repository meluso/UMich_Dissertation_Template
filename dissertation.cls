%%
%% This is the file dissertation.cls.
%% It provides a LaTeX class that is consistent with the guidelines
%% provided by the Rackham Graduate School as described at
%%   <https://rackham.umich.edu/navigating-your-degree/formatting-guidelines/>
%%
%% Based on the legacy thesis-umich.cls but simplified to focus on the 
%% current Rackham requirements with extraneous options removed.
%%
%% The correct usage of this template is to use it as a documentclass.
%% The first line of the .tex file should be
%%
%%     \documentclass{dissertation}
%%

%% ---- HEADERS --------------------------------------------------------
% This prevents the compiler from running on old versions of LaTeX.
\NeedsTeXFormat{LaTeX2e}

% This command gives the name of the class.
\ProvidesClass{dissertation}[2025/05/16 University of Michigan Dissertation Template]

%% ---- OPTIONS PROCESSING ---------------------------------------------
% Define switches for required features
\newif\if@umich@listoffigures
\newif\if@umich@listoftables
\newif\if@umich@listofprograms
\newif\if@umich@listofappendices
\newif\if@umich@listofacronyms
\newif\if@umich@listofsymbols
\newif\if@umich@copyright
\newif\if@umich@frontispiece
\newif\if@umich@dedication
\newif\if@umich@acknowledgments
\newif\if@umich@preface
\newif\if@umich@abstract

% Set the default value of some of the options to true.
\@umich@listoffigurestrue
\@umich@listoftablestrue
\@umich@copyrighttrue

% This declares a variable for using an index (not allowed in dissertations).
\newif\if@umich@index

% This passes any other options on to the 'report' class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}%
 \typeout{Unknown option: passing ``\CurrentOption"
  option on to the standard LaTeX report class.}}

% This command tells LaTeX to simply process the class options.
\ProcessOptions

% Call the report class with 12pt fonts and one-sided formatting.
\LoadClass[letterpaper,12pt,oneside]{report}

% Make sure the index is off.
\@umich@indexfalse

%% ---- PACKAGE LOADING ------------------------------------------------
% Use the standard margins.
\RequirePackage[margin=1in,left=1in,headheight=0.5\baselineskip]{geometry}

% This loads the required math packages.
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}

% This loads the proper graphics package.
\RequirePackage{graphicx}

% This is useful for complex figures.
\RequirePackage{subcaption}

% Compress multiple citations
\RequirePackage{natbib}

% This package allows the ability to create a 'code' environment.
\RequirePackage{verbatim}

% This hopefully tells verbatim to leave quotes alone.
\RequirePackage{upquote}

% This package enables the use of proper single quotes in text.
\RequirePackage{textcomp}

% This package is used to set line spacing.
\RequirePackage{setspace}

% This package allows conditional testing of variables.
\RequirePackage{ifthen}

% This package is used for silly letter spacing
\RequirePackage{soul}

% This package is used to generate alternate environments.
\RequirePackage{float}

% This package is used for the list of abbreviations
\RequirePackage{acronym}

% This package is used to support item list customization (for list of symbols)
\RequirePackage{enumitem}

% This is the package for special headers and footers.
\RequirePackage{fancyhdr}

% This package allows for appendices after the \appendix command
\RequirePackage[titletoc]{appendix}

% This package allows for adjusting section title formats
\RequirePackage{titlesec}

% This package allows for any font size
\RequirePackage{lmodern}

%% ---- FORMATTING -----------------------------------------------------
% Set the page style to fancy.
\pagestyle{fancy}
% This command runs at the beginning of each chapter.
% It puts the name of the chapter into the 'leftmark' parameter.
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
% This command runs at the beginning of each section.
% It puts the number and name of the section into the 'rightmark' param.
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}

% Clear the current header and footer.
\fancyhf{}

% Simply put the page number at the bottom center.
\fancyfoot[C]{\thepage}
% Get rid of the line at the top.
\renewcommand{\headrulewidth}{0pt}

% This sets the headers and footers for less-marked pages.
% Example: beginning of each chapter.
\fancypagestyle{plain}{%
% Get rid of the headers on plain pages.
 \fancyhead{} %
 % And also any line.
 \renewcommand{\headrulewidth}{0pt}
 \fancyfoot[C]{\thepage}
}

%% ---- PAGE STYLES ----------------------------------------------------
% This \ttlpg is the same as \titlepage in report.sty.
% It is used here to set the low-level style of front pages without page numbers.
\newcommand*{\ttlpg}{ %
 % Set one-column switch temporarily to false.
 \@restonecolfalse %
 % Check the number of columns.
 \if@twocolumn %
  \@restonecoltrue\onecolumn %
 \else %
  \newpage %
 \fi
 % No headers or footers on titlepage
 \thispagestyle{empty}
 % This sets the page counter.
 \c@page \z@ %
}

% Same idea as \ttlpg above but with page numbers
\newcommand*{\frntpg}{ %
 % Set one-column switch temporarily to false.
 \@restonecolfalse %
 % Check the number of columns.
 \if@twocolumn %
  \@restonecoltrue\onecolumn %
 \else %
  \newpage %
 \fi
 % Regular headers and footers
 \thispagestyle{plain}
}

%% ---- TITLE PAGE -----------------------------------------------------
% The fields to be used for the title page
\renewcommand{\@title}{Insert a Title!}
\renewcommand{\@author}{Insert an Author!}
\newcommand{\@legalname}{\@author}
\newcommand{\@degreetype}{Doctor of Philosophy}
\newcommand{\@department}{Insert a Department Name!}
\newcommand{\@committee}{Insert a Committee!}
\newcommand{\@chair}{Insert a Chair!}
\newcommand{\@cochair}{}

% Commands to set the titlepage fields
\renewcommand{\title}[1]{\renewcommand{\@title}{#1}}
\renewcommand{\author}[1]{\renewcommand{\@author}{#1}}
\newcommand{\legalname}[1]{\renewcommand{\@legalname}{#1}}
\newcommand{\degreetype}[1]{\renewcommand{\@degreetype}{#1}}
\newcommand{\department}[1]{\renewcommand{\@department}{#1}}
\newcommand{\committee}[1]{\renewcommand{\@committee}{#1}}
\newcommand{\chair}[1]{\renewcommand{\@chair}{#1}}
\newcommand{\cochair}[1]{\renewcommand{\@cochair}{#1}}

% Commands for the user to be able to use the defined fields.
\newcommand{\inserttitle}{\@title}
\newcommand{\insertauthor}{\@author}
\newcommand{\insertlegalname}{\@legalname}
\newcommand{\insertdegreetype}{\@degreetype}
\newcommand{\insertdepartment}{\@department}
\newcommand{\insertcommittee}{\@committee}
\newcommand{\insertchair}{\@chair}
\newcommand{\insertcochair}{\@cochair}
\newcommand{\insertyear}{\number\year}

% This redefines the title page to automatically have all of the
% features and properties that it should according to the guidelines.
\renewcommand*{\titlepage}{
 % Insert the titlepage formatting.
 \ttlpg %
 % Use single-spaced lines for the title page.
 \begin{singlespace} %
  % Move down the page slightly.
  \hbox{\vspace{1.5in}} %
  % Center the title page as well.
  \begin{center} %
   % Put the title itself in 1.5-spaced format.
   \begin{onehalfspacing}
    % Insert the title.
    {\bfseries\inserttitle} %
   \end{onehalfspacing} \\[4ex] %
   % Print the word 'by'.
   by \\[2ex] %
   % Insert the author
   \insertauthor \\ %
   % More rubber space
   \vfill %
   % Text from guidelines
   A dissertation submitted in partial fulfillment \\ %
   of the requirements for the degree of \\ %
   % Name of degree
   \insertdegreetype \\ %
   % Department
   (\insertdepartment) \\ %
   in The University of Michigan \\ %
   % Year of completion
   \number\year %
  \end{center} %
  % More rubber space
  \vfill %
  % Non-justified content
  \begin{flushleft}
   % Heading for the committee
   Doctoral Committee: \\[2ex] %
   % Horizontal spacing
   \hspace{0.5in} %
   % Insert the committee (in a box).
   \parbox{4.2in}{\insertcommittee}
  \end{flushleft} %
 \end{singlespace} %
}

%% ---- FRONTISPIECE ---------------------------------------------------
% Command for the frontispiece
\newcommand{\@frontispiece}{\@empty}

% Command to set the frontispiece
\newcommand{\frontispiece}[1]{
 % Turn the frontispiece on.
 \@umich@frontispiecetrue %
 % Set the frontispiece.
 \renewcommand{\@frontispiece}{#1}}

% Command to insert the frontispiece
\newcommand{\insertfrontispiece}{\@frontispiece}

% Command for the frontispiece page
\newcommand*{\frontispiecepage}{ %
 % Insert the titlepage formatting.
 \ttlpg %
 % Center the page.
 \begin{center} %
  % Vertical rubber space
  \ \vfill %
  % Insert the frontispiece.
  \insertfrontispiece %
  % Vertical rubber space
  \vfill %
 \end{center} %
}

%% ---- COPYRIGHT PAGE -------------------------------------------------
% Commands for copyright holder's contact information
\newcommand{\@email}{Insert your email address!}
\newcommand{\@orcid}{}
\newcommand{\email}[1]{\renewcommand{\@email}{#1}}
\newcommand{\orcid}[1]{\renewcommand{\@orcid}{#1}}
\newcommand{\insertemail}{\@email}
\newcommand{\insertorcid}{\@orcid}

% Command that holds the name of the copyright holder
\newcommand{\@copyright}{\@legalname}

% Command to change it from the default
\newcommand{\copyrightholder}[1]{\renewcommand{\@copyright}{#1}}

% Command to insert it
\newcommand{\insertcopyrightholder}{\@copyright}

% Command for copyright page
\newcommand*{\copyrightpage}{ %
 % Insert the titlepage formatting.
 \ttlpg %
 % Center the page.
 \begin{center} %
  % Vertical rubber space
  \ \vfill %
  % Insert the author's name
  \@legalname \\[1ex] %
  % Insert the author's email address
  \@email \\[1ex] %
  % Insert the author's ORCID iD
  ORCID iD: \space \@orcid \\[3ex] %
  % The year of publication
  \copyright \space \insertcopyrightholder \space \number\year %
  % Vertical rubber space
  \vfill %
 \end{center} %
}

%% ---- COMMANDS TO HIDE/SHOW FRONT PAGES ------------------------------
% Commands to show front pages
\newcommand{\showcopyright}{\@umich@copyrighttrue}
\newcommand{\showdedication}{\@umich@dedicationtrue}
\newcommand{\showacknowledgments}{\@umich@acknowledgmentstrue}
\newcommand{\showpreface}{\@umich@prefacetrue}
\newcommand{\showabstract}{\@umich@abstracttrue}

% Commands to hide front pages
\newcommand{\hidecopyright}{\@umich@copyrightfalse}
\newcommand{\hidededication}{\@umich@dedicationfalse}
\newcommand{\hideacknowledgments}{\@umich@acknowledgmentsfalse}
\newcommand{\hidepreface}{\@umich@prefacefalse}
\newcommand{\hideabstract}{\@umich@abstractfalse}

%% ---- FRONT MATTER FORMATTING ----------------------------------------
% Common front matter formatting function following style 7 (hardcoded)
\newcommand{\formatfrontmatter}[2]{
  % Vertical space
  \vspace*{1in} %
  % Set paragraphs to be indented
  \setlength{\parindent}{15pt}
  % Force 1.5 spacing for front matter sections
  \onehalfspacing
  % Heading
  \centerline{\fontsize{16}{16}\bf \uppercase{#1}}
  % Add some space after the title.
  \vspace{2ex}
  % Insert the text.
  \sloppy #2 %
}

%% ---- DEDICATION PAGE ------------------------------------------------
% Command that holds the value text of the dedication
\newcommand{\@dedication}{}

% Command to change it from the default
\newcommand{\dedication}[1]{
 % Show the dedication.
 \showdedication %
 % Set the dedication text.
 \renewcommand{\@dedication}{#1}}

% Command to insert it
\newcommand{\insertdedication}{\@dedication}

% Command for page with the dedication
\newcommand*{\dedicationpage}{
 % Set the page formatting.
 \frntpg %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{frontchapter}{Dedication}
 % Apply formatting style 7
 \formatfrontmatter{Dedication}{\@dedication}
}

%% ---- ACKNOWLEDGMENTS PAGE -------------------------------------------
% Command that holds the value text of the acknowledgments
\newcommand{\@acknowledgments}{}

% Command to change it from the default
\newcommand{\acknowledgments}[1]{
 % Show the acknowledgments page.
 \showacknowledgments %
 % Set the acknowledgments text.
 \renewcommand{\@acknowledgments}{#1}}

% Command to insert it
\newcommand{\insertacknowledgments}{\@acknowledgments}

% Command for page with the acknowledgments
\newcommand*{\acknowledgmentspage}{
 % Set the page formatting.
 \frntpg %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{frontchapter}{Acknowledgements}
 % Apply formatting style 7
 \formatfrontmatter{Acknowledgements}{\@acknowledgments}
}

%% ---- PREFACE PAGE ---------------------------------------------------
% Command that holds the value text of the preface
\newcommand{\@preface}{}

% Command to change it from the default
\newcommand{\preface}[1]{
 % Show the preface.
 \showpreface %
 % Set the preface text.
 \renewcommand{\@preface}{#1}}

% Command to insert it
\newcommand{\insertpreface}{\@preface}

% Command for page with the preface
\newcommand*{\prefacepage}{
 % Set the page formatting.
 \frntpg %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{frontchapter}{Preface}
 % Apply formatting style 7
 \formatfrontmatter{Preface}{\@preface}
}

%% ---- COMMANDS FOR LIST OF FIGURES, ETC. -----------------------------
% Commands to show each of the lists
\newcommand{\showlistoffigures}{\@umich@listoffigurestrue}
\newcommand{\showlistoftables}{\@umich@listoftablestrue}
\newcommand{\showlistofprograms}{\@umich@listofprogramstrue}
\newcommand{\showlistofappendices}{\@umich@listofappendicestrue}
\newcommand{\showlistofacronyms}{\@umich@listofacronymstrue}
\newcommand{\showlistofsymbols}{\@umich@listofsymbolstrue}

% Commands to hide each of the lists
\newcommand{\hidelistoffigures}{\@umich@listoffiguresfalse}
\newcommand{\hidelistoftables}{\@umich@listoftablesfalse}
\newcommand{\hidelistofprograms}{\@umich@listofprogramsfalse}
\newcommand{\hidelistofappendices}{\@umich@listofappendicesfalse}
\newcommand{\hidelistofacronyms}{\@umich@listofacronymsfalse}
\newcommand{\hidelistofsymbols}{\@umich@listofsymbolsfalse}

%% ---- TABLE OF CONTENTS AND LISTS ------------------------------------

% This sets the formatting for frontchapter entries in the table of contents.
\newcommand*{\l@frontchapter}[2]{
 % First add some vertical space.
 \vskip 1ex plus 1pt minus 1pt
 % Format the spacing and use dots between title and number.
 \@dottedtocline{1}{0em}{1.0em} %
 % This sets the formatting for the chapter name and page number.
 {\uppercase{#1}}{#2} %
 % Add some space below, too.
 \vskip 1ex}

% This sets the formatting for chapter entries in the table of contents.
\renewcommand*\l@chapter[2]{
 % First add some vertical space.
 \vskip 1ex plus 1pt minus 1pt
 % Format the spacing and use dots between title and number.
 \@dottedtocline{1}{0em}{1.0em} %
 % This sets the formatting for the chapter name and page number.
 {\textbf{#1}}{\textbf{#2}} %
 % Add some space below, too.
 \vskip 1ex}
 
% Set level of frontchapter
\providecommand*{\toclevel@frontchapter}{0}%
 
% This sets the formatting for backchapter entries in the table of contents.
\newcommand*{\l@backchapter}[2]{
 % First add some vertical space.
 \vskip 1ex plus 1pt minus 1pt
 % Format the spacing and use dots between title and number.
 \@dottedtocline{1}{0em}{1.0em} %
 % This sets the formatting for the chapter name and page number.
 {\uppercase{#1}}{#2} %
 % Add some space below, too.
 \vskip 1ex}

% Set level of backchapter
\providecommand*{\toclevel@backchapter}{0}%

% These lines set the spacing for other table of contents entries.
\renewcommand*{\l@section}{\@dottedtocline{2}{2.5em}{2em}}
\renewcommand*{\l@subsection}{\@dottedtocline{3}{5.0em}{2.8em}}
\renewcommand*{\l@subsubsection}{\@dottedtocline{4}{7.5em}{3.5em}}

% Number of section layers to show in table of contents
\setcounter{tocdepth}{3}
% Number of subsection layers to allow in document
\setcounter{secnumdepth}{3}

% This sets the formatting of the table of contents.
\renewcommand*{\tableofcontents}{%
 % Move to new page.
 \newpage %
 % Add a pdf anchor.
 \phantomsection %
 % Add a bookmark manually for the table of contents.
 \pdfbookmark[0]{Table of Contents}{\thepage} %
 % Use front page styling.
 \frntpg %
 % Larger upper margin for first page of table
 \vspace*{1in}
 % Add the title
 \centerline{\fontsize{16}{16}\bf TABLE OF CONTENTS} %
 % Add some space after the title.
 \vspace{2ex} %
 % Start the automatic table of contents features.
 \begin{singlespace} %
  \@starttoc{toc}\if@restonecol\twocolumn\fi %
 \end{singlespace} %
}

%% ---- LIST OF FIGURES ------------------------------------------------
% This sets the formatting for the various entry types.
\renewcommand*{\l@figure}{\@dottedtocline{1}{0em}{2.5em}}

% This sets the formatting of the list of figures page.
\renewcommand*{\listoffigures}{%
 % Move to new page.
 \newpage %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{frontchapter}{List of Figures} %
 % Use front page styling.
 \frntpg %
 % Larger upper margin for first page of table
 \vspace*{1in}
 % Add the title
 \centerline{\fontsize{16}{16}\bf LIST OF FIGURES} %
 % Add some space after the title.
 \vspace{1ex} %
 % Start the automatic table of contents features.
 \begin{singlespace} %
  \@starttoc{lof}\if@restonecol\twocolumn\fi %
 \end{singlespace} %
 \addtocontents{lof}{\hbox{FIGURE}}
}

%% ---- LIST OF TABLES -------------------------------------------------
% This sets the format for the table entries.
\renewcommand*{\l@table}{\@dottedtocline{1}{0em}{2.5em}}

% This sets the formatting of the list of tables page.
\renewcommand*{\listoftables}{%
 % Move to new page.
 \newpage %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{frontchapter}{List of Tables} %
 % Use front page styling.
 \frntpg %
 % Larger upper margin for first page of table
 \vspace*{1in}
 % Add the title
 \centerline{\fontsize{16}{16}\bf LIST OF TABLES} %
 % Add some space after the title.
 \vspace{1ex} %
 % Start the automatic table of contents features.
 \begin{singlespace} %
  \@starttoc{lot}\if@restonecol\twocolumn\fi %
 \end{singlespace} %
 \addtocontents{lot}{\hbox{TABLE}}
}

%% ---- LIST OF PROGRAMS -----------------------------------------------
% Command to generate the 'program' environment.
\newfloat{program}{tbp}{lop}[chapter]
% Use a capitalized version for the captions.
\floatname{program}{Program}

% This sets the formatting for entries in the list of programs
\newcommand*{\l@program}{\@dottedtocline{1}{0em}{2.5em}}

% This sets the formatting of the list of programs page.
\newcommand*{\listofprograms}{%
 % Move to new page.
 \newpage %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{frontchapter}{List of Programs} %
 % Anchor for pdf
 \phantomsection %
 % Use front page styling.
 \frntpg %
 % Larger upper margin for first page of table
 \vspace*{1in}
 % Add the title
 \centerline{\fontsize{16}{16}\bf LIST OF PROGRAMS} %
 % Add some space after the title.
 \vspace{1ex} %
 % Start the automatic table of contents features.
 \begin{singlespace} %
  \@starttoc{lop}\if@restonecol\twocolumn\fi %
 \end{singlespace} %
 \addtocontents{lop}{\hbox{PROGRAM}}
}

%% ---- LIST OF APPENDICES ---------------------------------------------
% This sets the formatting for appendices in the list.
\newcommand*{\l@appendix}{\@dottedtocline{1}{0em}{2.5em}}
\renewcommand*{\l@section}{\@dottedtocline{1}{\@pnumwidth}{2.5em}}

% This sets the formatting of the list of appendices page.
\newcommand*{\listofappendices}{%
 % Move to new page.
 \newpage %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{frontchapter}{List of Appendices} %
 % Anchor for pdf
 \phantomsection %
 % Use front page styling.
 \frntpg %
 % Larger upper margin for first page of table
 \vspace*{1in}
 % Add the title
 \centerline{\fontsize{16}{16}\bf LIST OF APPENDICES} %
 % Add some space after the title.
 \vspace{1ex} %
 % Start the automatic table of contents features.
 \begin{singlespace} %
  \@starttoc{loapp}\if@restonecol\twocolumn\fi %
 \end{singlespace} %
 \addtocontents{loapp}{\hbox{APPENDIX}}
}

%% ---- LIST OF ACRONYMS -----------------------------------------------
% Variable holding the contents of the abbreviations.
\newcommand{\@acronyms}{}

% Command to set the abbreviations.
\newcommand{\acronyms}[1]{
 % Show the list of acronyms.
 \@umich@listofacronymstrue %
 % Redefine the list.
 \renewcommand{\@acronyms}{#1}}

% This sets the formatting for the abbreviations.
\newcommand*{\l@acronym}{\@dottedtocline{1}{0em}{2.5em}}

% This sets the formatting of the list of acronyms page.
\newcommand*{\listofacronyms}{%
 % Move to new page.
 \newpage %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{frontchapter}{List of Acronyms} %
 % Use front page styling.
 \frntpg %
 % Larger upper margin for first page of table
 \vspace*{1in}
 % Add the title
 \centerline{\fontsize{16}{16}\bf LIST OF ACRONYMS} %
 % Start the automatic abbreviations feature.
 \begin{singlespace} %
  \begin{acronym} %
   \@acronyms %
  \end{acronym} %
 \end{singlespace} %
}

%% ---- LIST OF SYMBOLS ------------------------------------------------
% Variable holding the contents of the symbols.
\newcommand{\@symbols}{}

% Command to set the symbols.
\newcommand{\symbols}[1]{
 % Show the list of symbols.
 \@umich@listofsymbolstrue %
 % Redefine the list.
 \renewcommand{\@symbols}{#1}}

% This sets the formatting for the abbreviations.
\newcommand*{\l@symbol}{\@dottedtocline{1}{0em}{2.5em}}

% This sets the formatting of the list of tables page.
\newcommand*{\listofsymbols}{%
 % Move to new page.
 \newpage %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{frontchapter}{List of Symbols} %
 % Use front page styling.
 \frntpg %
 % Larger upper margin for first page of table
 \vspace*{1in}
 % Add the title
 \centerline{\fontsize{16}{16}\bf LIST OF SYMBOLS} %
 % Add some space after the title.
 \vspace{1ex} %
 % Start the automatic symbols feature.
 \begin{singlespace} %
  \begin{itemize}[labelwidth={3em}, align=left, leftmargin=3.5em] %
   \@symbols %
  \end{itemize} %
 \end{singlespace} %
}

%% ---- ABSTRACT -------------------------------------------------------
% Command to hold the text of the abstract.
\newcommand{\@abstract}{}

% Command to set it.
\renewcommand{\abstract}[1]{
 % Show the abstract page.
 \showabstract %
 % Set the abstract text.
 \renewcommand{\@abstract}{#1}}

% Command to insert it.
\newcommand{\insertabstract}{\@abstract}

% Whether or not abstract page has a page number
\newif\if@abstract@pageno
% Default value
\@abstract@pagenotrue

% Command to hide abstract page number
\newcommand{\hideabstractpagenumber}{
 \@abstract@pagenofalse}
% Command to show abstract page number
\newcommand{\showabstractpagenumber}{
 \@abstract@pagenotrue}

% Format the abstract page.
\newcommand{\abstractpage}{
 % Set the page formatting.
 \frntpg %
 % Whether or not to hide the page number
 \if@abstract@pageno %
 \else %
  \thispagestyle{empty} %
 \fi %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{frontchapter}{Abstract} %
 % Extra vertical space
 \vspace*{1in}
 % Center the title area.
 \centerline{\fontsize{16}{16}\bf ABSTRACT} %
 % Add some space after the title.
 \vspace{2ex} %
 % Insert the abstract text.
 \onehalfspacing %
 % Insert the text.
 \insertabstract %
 % Vertical rubber space
 \vspace*{\stretch{1}} %
}

%% ---- APPENDICES -----------------------------------------------------
% Renew the command that starts the appendices.
\renewcommand{\appendix}{
 % Move to new page.
 \clearpage %
 % Renew the counters.
 \renewcommand*{\thechapter}{\Alph{chapter}} %
 % Start over the chapter counter.
 \setcounter{chapter}{0} %
 % Add a pdf anchor.
 \phantomsection %
 % Add blank space to table of contents
 \addtocontents{toc}{\vspace{3.9ex}}
 % Add the page to the table of contents.
 \addcontentsline{toc}{backchapter}{Appendices}
 % Stop adding sections to the table of contents.
 \addtocontents{toc}{\setcounter{tocdepth}{0}} %
 % Header for appendices.
 \renewcommand{\@chapapp}{APPENDIX} %
 % Renew the chapter and section labels.
 \let\@chapter\@chapter@appendix %
 % Renew the command for sections in the appendices.
 \renewcommand{\section}{\@section@appendix}
}

% Make a special chapter command for appendices.
\def\@chapter@appendix[#1]#2{
 % Increase the chapter letter.
 \refstepcounter{chapter} %
 % Print a line to the .log file.
 \typeout{\@chapapp\space\thechapter.} %
 % Hopefully this works.
 \phantomsection %
 % Add a bookmark manually.
 \pdfbookmark[0]{#1}{#2} %
 % Add sections to the table of contents.
 \addtocontents{loapp}{\setcounter{tocdepth}{1}} %
 % Add to the list of appendices rather than toc.
 \addcontentsline{loapp}{chapter}{\protect\numberline{\thechapter}\space#1} %
 % Save the chapter number.
 \chaptermark{#1} %
 % Add extra space to the lists of figures and tables and programs.
 \addtocontents{lof}{\protect\addvspace{8pt}} %
 \addtocontents{lot}{\protect\addvspace{8pt}} %
 \addtocontents{lop}{\protect\addvspace{8pt}} %
 % Produce the appropriate headings for the first page.
 \if@twocolumn %
  \@topnewpage[\@makechapterhead{#2}] %
 \else %
  \@makechapterhead{#2} %
  \@afterheading %
 \fi }

% Make a special section command for the appendices.
\def\@section@appendix#1{
  % Begin the phantom section to accommodate hyperref package
  \phantomsection
  % Save the section number
  \sectionmark{#1}
  % Issue the start section command
  \@startsection{section} % Use the default formatting settings
    {1} %
    {0pt} %
    {-3.5ex plus -1ex minus -0.2ex} %
    {2.3ex plus 0.2ex} %
    {\normalfont\fontsize{16}{16}\bfseries}
    {#1} % Add the section title text
  }

%% ---- BIBLIOGRAPHY ---------------------------------------------------
% Save the original bibliography command.
\let\@tex@bibliography\bibliography

% Change the bibliography header.
\renewcommand*{\bibname}{\vspace{0.35em}\centerline{\normalfont\fontsize{16}{16}\bfseries BIBLIOGRAPHY}\vspace{-0.35em}}

% Create a new command for the bibliography.
\renewcommand*{\bibliography}[1]{
 % Update the page format.
 % Switch to single spacing
 \singlespacing %
 % Move to new page.
 \clearpage %
 % Create a pdf anchor.
 \phantomsection %
 % Make sure to counter depth is correct so bibliography gets added to the table of contents.
 \addtocontents{toc}{\setcounter{tocdepth}{1}} %
 % Add blank space to table of contents
 \addtocontents{toc}{\vspace{1.3ex}}
 % Add to table of contents.
 \addcontentsline{toc}{backchapter}{Bibliography} %
 % Load the bibliography.
 \@tex@bibliography{#1} %
}

%% ---- CODE ENVIRONMENT -----------------------------------------------
% This generates a 'code' environment that allows inline citations
% of small snippets of code.
\newenvironment{code} %
 {\quote\small\verbatim} %
 {\endverbatim\endquote}

%% ---- CHAPTER HEADINGS -----------------------------------------------
% Change the chapter headings to uppercase.
\renewcommand{\@chapapp}{CHAPTER}

% Change the formatting of the first page of each chapter.
\renewcommand{\@makechapterhead}[1]{%
 % Insert an extra top margin.
 \vspace*{1in}
 % Insert the text
 { %
  % Ensure proper alignment.
  \parindent 0pt \raggedright %
  % Check for chapter overflow.
  \ifnum \c@secnumdepth >\m@ne %
   % CHAPTER and number
   \centerline{\fontsize{16}{16}\bf \@chapapp{} \thechapter} \par %
   % Vertical space
   \vskip 0.3in \fi %
   % Insert the title of the chapter.
   \begin{center} \fontsize{16}{16}\bf #1 \end{center} %
   % Vertical space after the title
   \nobreak \vskip 0.3in %
 } %
}

%% ---- SECTION HEADINGS -----------------------------------------------
\titleformat{\section}{\vskip 0.5em\fontsize{16}{16}\bfseries}{\thesection}{1em}{}

%% ---- SPACING --------------------------------------------------------
% This fixes the spacing below captions, which by default can be small.
\setlength\belowcaptionskip{7pt plus 4pt minus 1pt}

%% ---- LINKS ----------------------------------------------------------
% This loads a package that allows extra colors for links.
\RequirePackage[dvipsnames]{xcolor}

% This will make labels and references hyperlinks.
\RequirePackage{hyperref, href-ul}

% This controls some settings that affect the appearance of links.
\hypersetup{
  colorlinks=true,
  pdfstartview={FitH},
  citecolor=Black,
  linkcolor=Black,
  urlcolor=Blue
}

% Add underlining to URLs via href-ul
\renewcommand{\url}[1]{\href{#1}{\nolinkurl{#1}}}
\urlstyle{same}

%% ---- INITIALIZATION -------------------------------------------------
% Commands to be placed after \begin{document}
\AtBeginDocument{
 % Insert a title page.
 \titlepage %
 % Change the PDF title.
 \hypersetup{pdftitle=\inserttitle,pdfauthor=\insertauthor} %
 % Insert the frontispiece if there is one.
 \if@umich@frontispiece\frontispiecepage\fi %
 % Insert the copyright page if there is one.
 \if@umich@copyright\copyrightpage\fi
 % Initialize page numbers.
 \setcounter{page}{1} %
 % Page numbers at the bottom
 \pagestyle{plain} %
 % Use lower-case roman numerals.
 \renewcommand{\thepage}{\roman{page}} %
 % Insert a dedication if there is one.
 \if@umich@dedication\dedicationpage\fi %
 % Insert the acknowledgments if there are any.
 \if@umich@acknowledgments\acknowledgmentspage\fi %
 % Insert the preface if there is one.
 \if@umich@preface\prefacepage\fi %
 % Insert the table of contents.
 \tableofcontents %
 % Insert the list of figures.
 \if@umich@listoffigures\listoffigures\fi %
 % Insert the list of tables.
 \if@umich@listoftables\listoftables\fi %
 % Insert the list of programs.
 \if@umich@listofprograms\listofprograms\fi %
 % Insert the list of appendices.
 \if@umich@listofappendices\listofappendices\fi %
 % Insert the list of acronyms.
 \if@umich@listofacronyms\listofacronyms\fi %
 % Insert the list of symbols.
 \if@umich@listofsymbols\listofsymbols\fi %
 % Insert the abstract.
 \if@umich@abstract\abstractpage\fi %
 % Move to next page.
 \newpage %
 % Restart page numbers for the chapters.
 \setcounter{page}{1} %
 % Page numbers at the bottom
 \pagestyle{plain} %
 % Use Arabic numerals.
 \renewcommand{\thepage}{\arabic{page}} %
 % Add the word 'Chapter' to the table of contents.
 \addtocontents{toc}{\vspace{3.9ex}\noindent %
 {\uppercase{Chapter}}\vspace{1.3ex}} %
 % Use 1.5 spacing (default, but can be overridden by the user)
 \onehalfspacing %
}