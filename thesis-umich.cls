%%
%% This is the file thesis-umich.cls.
%% It provides a LaTeX class that is consistent with the guidelines
%% provided by the Rackham Graduate School as described at
%%   <http://www.rackham.umich.edu/downloads/
%%               oard-dissertation-format-guidelines.pdf>
%%
%% This class is based on the LaTeX template provided at
%%   <http://aoss.engin.umich.edu/pages/current/dissertation-template>
%%
%% The correct usage of this template is to use it as a documentclass.
%% The first line of the .tex file should be
%%
%%     \documentclass{thesis-umich}
%%
%% if this file is in the same directory as the .tex file.  If the
%% two files are not in the same directory, the relative path from
%% the .tex file to this .cls file should be provided.  For example,
%% if the document is called thesis-dalle.tex and this file,
%% thesis-umich.cls is in a subfolder called 'tex', the command
%% should be
%%
%%     \documentclass{./tex/thesis-umich}
%%
%% An example is distributed with this file that demonstrates all
%% of the features of the template.  The example is in a file called
%% thesis-sample.tex.
%%

%% VERSIONS:
%%  1988.01.01 @Jin Ji            : Initial version; reportx.sty
%%  1988.05.19 @Jin Ji            : Unrecorded changes
%%  1988.12.13 @Jin Ji            : Corrected table of contents to show
%%                                  "CHAPTER" and also \@makecaption
%%  1989.01.08 @Jin Ji            : Corrections for section headers
%%  1989.11.29 @?                 : Removed a spurious command
%%  1992.07.24 @Roque D. Oliveira : Modified \startappendices to work
%%                                  with the New Font Selection Scheme.
%%  2008.09.01 @Jason Gilbert     : Obsolete code removed for
%%                                  compatibility with LaTeX2e; list of
%%                                  abbreviations added, made copyright
%%                                  page cleaner, fixed appendices, 
%%                                  bibliography, margins, title page,
%%                                  frontispiece, bottom-center page
%%                                  numbers, two-side printing, added
%%                                  in-dissertation abstract and
%%                                  abstract that prints at the end.
%%  2011.04.09 @Derek Dalle       : Convert rac.sty --> thesis.umich.cls
%%  2021.05.03 @John Meluso       : Updated to include current formatting
%%                                  requirements from the document
%%                                  dissertation-handbook.pdf
%%  2021.05.03 @Samuel Hansen     : Correctly 'acknowledgement' misspeling
%%

%% ---- HEADERS --------------------------------------------------------
% This prevents the compiler from running on old versions of LaTeX.
\NeedsTeXFormat{LaTeX2e}

% This command gives the name of the class.
\ProvidesClass{thesis-umich}[2011/04/09 Thesis template]

%% ---- OPTIONS PROCESSING ---------------------------------------------
% Define three switches for the the thesis format types.
% The variables are \@umich@thesis and \@umich@report.
% The default values are false.
\newif\if@umich@thesis
\newif\if@umich@report
\newif\if@umich@listoffigures
\newif\if@umich@listoftables
\newif\if@umich@listofmaps
\newif\if@umich@listofillustrations
\newif\if@umich@listofprograms
\newif\if@umich@listofappendices
\newif\if@umich@listofabbrevs
\newif\if@umich@listofsymbols
\newif\if@umich@listofacronyms
\newif\if@umich@copyright
\newif\if@umich@frontispiece
\newif\if@umich@dedication
\newif\if@umich@acknowledgments
\newif\if@umich@preface
\newif\if@umich@prologue
\newif\if@umich@foreword
\newif\if@umich@abstract

% Set the default value of some of the options to true.
\@umich@thesistrue
\@umich@listoffigurestrue
\@umich@listoftablestrue
\@umich@copyrighttrue

% This declares a variable for using an index.
% An index is not allowed in dissertations.
\newif\if@umich@index

% This makes an option for bibliography backrefs.
\newif\if@umich@backref

% Declare options for the overall layout.
\DeclareOption{thesis}{\@umich@thesistrue\@umich@reportfalse}
\DeclareOption{report}{\@umich@reporttrue\@umich@thesisfalse}

% Declare an option for the index.
\DeclareOption{index}{\@umich@indextrue}

% Declare an option for bibliography backrefs.
\DeclareOption{backref}{\@umich@backreftrue}


% This passes any other options on to the 'report' class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}%
 \typeout{Unknown option: passing ``\CurrentOption"
  option on to the standard LaTeX report class.}}
% This command tells LaTeX to simply process the class options.
\ProcessOptions

% This control structure calls the standard LaTeX report.cls class.
% The base font size should be 10pt unless using the submit option.
\if@umich@report
 % Call the report class with 10pt fonts and two-sided formatting.
 \LoadClass[letterpaper,10pt,twoside]{report}
\else
 % Call the report class with 12pt fonts and one-sided formatting.
 \LoadClass[letterpaper,12pt,oneside]{report}
\fi

% Make sure the index is off for 'thesis'.
\if@umich@thesis
 \@umich@indexfalse
\fi


%% ---- PACKAGE LOADING ------------------------------------------------
% This class uses the geometry.sty package to set the margins.
\if@umich@report
 % Use a 1-inch margin for all four sides for the report version.
 \RequirePackage[margin=1in,footskip=8pt,headsep=0.4cm,%
  headheight=\baselineskip]{geometry}
 % This sets the distance between columns.
 \setlength{\columnsep}{0.3in}
\else
 % Use the standard margins for the thesis version.
 \RequirePackage[margin=1in,left=1in, %
  headheight=0.5\baselineskip]{geometry}
\fi

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

% This hopefully tells verbatim to leave my damn quotes alone.
\RequirePackage{upquote}

% This package enables the use of proper single quotes in text.
\RequirePackage{textcomp}

% This package is used to set line spacing.
\RequirePackage{setspace}

% This package allows conditional testing of varibles.
\RequirePackage{ifthen}

% This package is used for silly letter spacing
\RequirePackage{soul}

% This package is used to generate alternate environments.
\RequirePackage{float}

% This package is used for the list of abbreviations
\RequirePackage{acronym}

% This package is used to support item list customization (for list of symbols)
\RequirePackage{enumitem}

% This package is for the index, if it is to be used.
\if@umich@index
 \RequirePackage{makeidx}
 \makeindex
\fi

% This is the package for special headers and footers.
\RequirePackage{fancyhdr}

% This package will allow for some sections to be in
% different numbers of columns.
\if@umich@report
 \RequirePackage{multicol}
\fi

% This package allows for appendices after the \appendix command
\RequirePackage[titletoc]{appendix}


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

% Set the header and footer for normal pages.
\if@umich@report
 \fancyhead[LE,RO]{\bfseries\thepage}
 \fancyhead[LO]{\bfseries\rightmark}
 \fancyhead[RE]{\bfseries\leftmark}
\else
 % Simply put the page number at the bottom center.
 \fancyfoot[C]{\thepage}
 % Get rid of the line at the top.
 \renewcommand{\headrulewidth}{0pt}
\fi

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
% It is used here to set the low-level style of front pages.
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
\newcommand{\@degree}{Doctor of Philosophy}
\newcommand{\@department}{Insert a Department Name!}
\newcommand{\@committee}{Insert a Committee!}
\newcommand{\@chair}{Insert a Chair!}
\newcommand{\@cochair}{}

% Commands to set the titlepage fields
\renewcommand{\title}[1]{\renewcommand{\@title}{#1}}
\renewcommand{\author}[1]{\renewcommand{\@author}{#1}}
\newcommand{\degree}[1]{\renewcommand{\@degree}{#1}}
\newcommand{\department}[1]{\renewcommand{\@department}{#1}}
\newcommand{\committee}[1]{\renewcommand{\@committee}{#1}}
\newcommand{\chair}[1]{\renewcommand{\@chair}{#1}}
\newcommand{\cochair}[1]{\renewcommand{\@cochair}{#1}}

% Commands for the user to be able to use the defined fields.
\newcommand{\inserttitle}{\@title}
\newcommand{\insertauthor}{\@author}
\newcommand{\insertdegree}{\@degree}
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
   % Vertical rubber space
%   \vfill %
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
   \insertdegree \\ %
   % Department
   (\insertdepartment) \\ %
   in the University of Michigan \\ %
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
\newcommand{\@copyright}{\@author}

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
  \@author \\[1ex] %
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


%% ---- STYLING FOR REMAINING FRONT PAGES ------------------------------
% Command to set the spacing for all-caps headings
\sodef\an{}{.6em}{1em plus1em}{2em plus.1em minus.1em}

% Default frontmatter style
\newcommand{\@frontpagestyle}{2}
% Command to change it
\newcommand{\frontpagestyle}[1]{\renewcommand{\@frontpagestyle}{#1}}

% Command to insert front page matter with styles
\newcommand{\insertfront}[4]{ %
 % Check the value of the style.
 
 \ifthenelse{\equal{#2}{1}}{ %
  % Style 1: plain text
  % Vertical rubber space
  \vspace*{\stretch{1}} %
  % Center on the page.
  \begin{center} %
   % Make a minipage.
   \begin{minipage}{#4\textwidth} %
    % Required to use 1.5-spacing for dissertation.
    \if@umich@thesis %
     \onehalfspacing %
    \fi %
    % Insert the text.
    \sloppy #1 %
   \end{minipage} %
  \end{center} %
  % Vertical rubber space
  \vspace*{\stretch{2}} %
 }{ %
 
 \ifthenelse{\equal{#2}{2}}{ %
  % Style 2: simple bold italic heading
  % Vertical rubber space
  \vspace*{\stretch{1}} %
  % Center on the page.
  \begin{center} %
   % Make a minipage.
   \begin{minipage}{#4\textwidth} %
    % Required to use 1.5-spacing for dissertation.
    \if@umich@thesis %
     \onehalfspacing %
    \fi %
    % Heading
    \begin{center}\textbf{\textit{#3}}\end{center} %
    % Insert the text.
    \sloppy #1 %
   \end{minipage} %
  \end{center} %
  % Vertical rubber space
  \vspace*{\stretch{2}} %
 }{ %
 
 \ifthenelse{\equal{#2}{3}}{ %
  % Style 3: Spread caps heading
  % Vertical rubber space
  \vspace*{\stretch{1}} %
  % Center on the page.
  \begin{center} %
   % Make a minipage.
   \begin{minipage}{#4\textwidth} %
    % Required to use 1.5-spacing for dissertation.
    \if@umich@thesis %
     \onehalfspacing %
    \fi %
    % Heading
    \begin{center} \textbf{\uppercase{\an{#3}}} \end{center} %
    % Insert the text.
    \sloppy #1 %
   \end{minipage} %
  \end{center} %
  % Vertical rubber space
  \vspace*{\stretch{2}} %
 }{ %
 
 \ifthenelse{\equal{#2}{4}}{ %
  % Style 4: lined
  % Vertical rubber space
  \vspace*{\stretch{1}} %
  % Center on the page.
  \begin{center} %
   % Make a minipage.
   \begin{minipage}{#4\textwidth}
    % Line above
    \rule[1.4ex]{\textwidth}{1pt} %
    % Required to use 1.5-spacing for dissertation.
    \if@umich@thesis %
     \onehalfspacing %
    \fi %
    % Insert the text.
    \sloppy #1 \\ %
    % Line below
    \rule{\textwidth}{1pt} %
   \end{minipage} %
  \end{center} %
  % Vertical rubber space
  \vspace*{\stretch{2}} %
 }{ %
 
 \ifthenelse{\equal{#2}{5}}{ %
  % Style 5: bold italic heading with lines
  % Vertical rubber space
  \vspace*{\stretch{1}} %
  % Center on the page.
  \begin{center} %
    % Make a minipage.
   \begin{minipage}{#4\textwidth}
    % Heading
    \begin{center} \textbf{\textit{#3}} \end{center} %
    % Move up a bit.
    \ \\[-4ex] %
    % Line above
    \rule[1.4ex]{\textwidth}{1pt} %
    % Required to use 1.5-spacing for dissertation.
    \if@umich@thesis %
     \onehalfspacing %
    \fi %
    % Insert the text.
    \sloppy #1 \\ %
    % Line below
    \rule{\textwidth}{1pt} %
   \end{minipage} %
  \end{center} %
  % Vertical rubber space
  \vspace*{\stretch{2}} %
 }{ %
 
 \ifthenelse{\equal{#2}{6}}{ %
  % Style 6: lined with spread caps header
  % Vertical rubber space
  \vspace*{\stretch{1}} %
  % Center on the page.
  \begin{center} %
    % Make a minipage.
   \begin{minipage}{#4\textwidth}
    % Heading
    \begin{center} \textbf{\uppercase{\an{#3}}} \end{center} %
    % Move up a bit.
    \ \\[-4ex] %
    % Line above
    \rule[1.4ex]{\textwidth}{1pt} %
    % Required to use 1.5-spacing for dissertation.
    \if@umich@thesis %
     \onehalfspacing %
    \fi %
    % Insert the text.
    \sloppy #1 \\ %
    % Line below
    \rule{\textwidth}{1pt} %
   \end{minipage} %
  \end{center} %
  % Vertical rubber space
  \vspace*{\stretch{2}} %
  }{ %
  
  \ifthenelse{\equal{#2}{7}}{ %
  % Style 7: simple large bold caps heading
  % Vertical rubber space
  \vspace*{1in} %
  % Center on the page.
  %\begin{center} %
   % Make a minipage.
   %\begin{minipage}{#4\textwidth} %
    % Set paragraphs to be indented
    \setlength{\parindent}{15pt}
    % Required to use 1.5-spacing for dissertation.
    \if@umich@thesis %
     \onehalfspacing %
    \fi %
    % Heading
    \begin{center}\textbf{\large\uppercase{#3}}\end{center} %
    % Insert the text.
    %\hspace{15pt}
    \sloppy #1 %
   %\end{minipage} %
  %\end{center} %
  % Vertical rubber space
  %\vspace*{\stretch{2}} %
 }{ %
 
  % Default style: centered
  % Vertical rubber space
  \vspace*{\stretch{1}} %
  % Center on the page.
  \begin{center} %
   % Make a minipage.
   \begin{minipage}{0.7\textwidth} %
    % Insert the text.
    \begin{center} \sloppy #1 \end{center} %
   \end{minipage} %
 \end{center} %
  % Vertical rubber space
  \vspace*{\stretch{1}} %
 }}}}}}} %
}

%% ---- COMMANDS TO HIDE/SHOW FRONT PAGES ------------------------------
% Commands to show front pages
\newcommand{\showcopyright}{\@umich@copyrighttrue}
\newcommand{\showdedication}{\@umich@dedicationtrue}
\newcommand{\showacknowledgments}{\@umich@acknowledgmentstrue}
\newcommand{\showpreface}{\@umich@prefacetrue}
\newcommand{\showforeword}{\@umich@forewordtrue}
\newcommand{\showprologue}{\@umich@prologuetrue}
\newcommand{\showabstract}{\@umich@abstracttrue}

% Commands to hide front pages
\newcommand{\hidecopyright}{\@umich@copyrightfalse}
\newcommand{\hidededication}{\@umich@dedicationfalse}
\newcommand{\hideacknowledgments}{\@umich@acknowledgmentsfalse}
\newcommand{\hidepreface}{\@umich@prefacefalse}
\newcommand{\hideforeword}{\@umich@forewordfalse}
\newcommand{\hideprologue}{\@umich@prologuefalse}
\newcommand{\hideabstract}{\@umich@abstractfalse}


%% ---- DEDICATION PAGE ------------------------------------------------
% Command that holds the value text of the dedication
\newcommand{\@dedication}{}
% Command that sets the dedication style
\newcommand{\@dedicationstyle}{\@frontpagestyle}
% Command that sets the width of the dedication text area
\newcommand{\@dedication@width}{1}

% Command to change it from the default
\newcommand{\dedication}[2][]{ %
 % Show the dedication.
 \showdedication %
 % Set the dedication text.
 \renewcommand{\@dedication}{#2} %
 % Set the dedication style.
 \ifthenelse{\equal{#1}{}}{}{\renewcommand{\@dedicationstyle}{#1}}}
% Command to change just the dedication style
\newcommand{\dedicationstyle}[1]{\renewcommand{\@dedicationstyle}{#1}}
% Command to adjust the dedication text area width
\newcommand{\dedicationwidth}[1]{\renewcommand{\@dedication@width}{#1}}

% Command to insert it
\newcommand{\insertdedication}{\@dedication}

% Command for page with the dedication
\newcommand*{\dedicationpage}{ %
 % Set the page formatting.
 \frntpg %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{frontchapter}{Dedication}
 % Insert the text and formatting.
 \insertfront{\@dedication %
  }{\@dedicationstyle}{Dedication}{\@dedication@width}
}


%% ---- ACKNOWLEDGMENTS PAGE -------------------------------------------
% Command that holds the value text of the acknowledgments
\newcommand{\@acknowledgments}{}
% Command that sets the acknowledgments style
\newcommand{\@acknowledgmentsstyle}{\@frontpagestyle}
% Command that sets the width of the acknowledgments text area
\newcommand{\@acknowledgments@width}{1}

% Command to change it from the default
\newcommand{\acknowledgments}[2][]{ %
 % Show the acknowledgments page.
 \showacknowledgments %
 % Set the acknowledgments text.
 \renewcommand{\@acknowledgments}{#2} %
 % Set the acknowledgments style.
 \ifthenelse{\equal{#1}{}}{}{ %
  \renewcommand{\@acknowledgmentsstyle}{#1}}}
% Command to adjust the acknowledgments text area width
\newcommand{\acknowledgmentswidth}[1]{ %
 \renewcommand{\@acknowledgments@width}{#1}}
% Command to change just the acknowledgements style
\newcommand{\acknowledgmentsstyle}[1]{ %
 \renewcommand{\@acknowledgmentsstyle}{#1}}

% Command to insert it
\newcommand{\insertacknowledgments}{\@acknowledgments}

% Command for page with the acknowledgments
\newcommand*{\acknowledgmentspage}{ %
 % Set the page formatting.
 \frntpg %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{frontchapter}{Acknowledgements}
 % Insert the text and formatting.
 \insertfront{\@acknowledgments %
  }{\@acknowledgmentsstyle}{Acknowledgements}{\@acknowledgments@width}
}


%% ---- PREFACE PAGE ---------------------------------------------------
% Command that holds the value text of the preface
\newcommand{\@preface}{}
% Command that sets the preface style
\newcommand{\@prefacestyle}{\@frontpagestyle}
% Command that sets the width of the preface text area
\newcommand{\@preface@width}{1}

% Command to change it from the default
\newcommand{\preface}[2][]{ %
 % Show the preface.
 \showpreface %
 % Set the preface text.
 \renewcommand{\@preface}{#2} %
 % Set the preface style.
 \ifthenelse{\equal{#1}{}}{}{ %
  \renewcommand{\@prefacestyle}{#1}}}
% Command to adjust the preface text area width
\newcommand{\prefacewidth}[1]{ %
 \renewcommand{\@preface@width}{#1}}
% Command to change just the preface style
\newcommand{\prefacestyle}[1]{ %
 \renewcommand{\@prefacestyle}{#1}}

% Command to insert it
\newcommand{\insertpreface}{\@preface}

% Command for page with the preface
\newcommand*{\prefacepage}{ %
 % Set the page formatting.
 \frntpg %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{frontchapter}{Preface}
 % Insert the text and formatting.
 \insertfront{\@preface %
  }{\@prefacestyle}{Preface}{\@preface@width}
}


%% ---- FOREWORD PAGE --------------------------------------------------
% Command that holds the value text of the foreword
\newcommand{\@foreword}{}
% Command that sets the foreword style
\newcommand{\@forewordstyle}{\@frontpagestyle}
% Command that sets the width of the foreword text area
\newcommand{\@foreword@width}{1}

% Command to change it from the default
\newcommand{\foreword}[2][]{ %
 % Show the foreword.
 \showforeword %
 % Set the foreword text.
 \renewcommand{\@foreword}{#2} %
 % Set the foreword style.
 \ifthenelse{\equal{#1}{}}{}{ %
  \renewcommand{\@forewordstyle}{#1}}}
% Command to adjust the foreword text area width
\newcommand{\forewordwidth}[1]{ %
 \renewcommand{\@foreword@width}{#1}}
% Command to change just the foreword style
\newcommand{\forewordstyle}[1]{ %
 \renewcommand{\@forewordstyle}{#1}}

% Command to insert it
\newcommand{\insertforeword}{\@foreword}

% Command for page with the foreword
\newcommand*{\forewordpage}{ %
 % Set the page formatting.
 \frntpg %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{frontchapter}{Foreword}
 % Insert the text and formatting.
 \insertfront{\@foreword %
  }{\@forewordstyle}{Foreword}{\@foreword@width}
}


%% ---- PROLOGUE PAGE --------------------------------------------------
% Command that holds the value text of the prologue
\newcommand{\@prologue}{}
% Command that sets the prologue style
\newcommand{\@prologuestyle}{\@frontpagestyle}
% Command that sets the width of the prologue text area
\newcommand{\@prologue@width}{1}

% Command to change it from the default
\newcommand{\prologue}[2][]{ %
 % Show the prologue.
 \showprologue %
 % Set the prologue text.
 \renewcommand{\@foreword}{#2} %
 % Set the prologue style.
 \ifthenelse{\equal{#1}{}}{}{ %
  \renewcommand{\@prologuestyle}{#1}}}
% Command to adjust the prologue text area width
\newcommand{\prologuewidth}[1]{ %
 \renewcommand{\@prologue@width}{#1}}
% Command to change just the prologue style
\newcommand{\prologuestyle}[1]{ %
 \renewcommand{\@prologuestyle}{#1}}

% Command to insert it
\newcommand{\insertprologue}{\@prologue}

% Command for page with the prologue
\newcommand*{\prologuepage}{ %
 % Set the page formatting.
 \frntpg %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{frontchapter}{Prologue}
 % Insert the text and formatting.
 \insertfront{\@prologue %
  }{\@prologuestyle}{Prologue}{\@prologue@width}
}


%% ---- COMMANDS FOR LIST OF FIGURES, ETC. -----------------------------
% Commands to show each of the lists
\newcommand{\showlistoffigures}{\@umich@listoffigurestrue}
\newcommand{\showlistoftables}{\@umich@listoftablestrue}
\newcommand{\showlistofmaps}{\@umich@listofmapstrue}
\newcommand{\showlistofillustrations}{\@umich@listillustrationstrue}
\newcommand{\showlistofprograms}{\@umich@listofprogramstrue}
\newcommand{\showlistofappendices}{\@umich@listofappendicestrue}
\newcommand{\showlistofabbreviations}{\@umich@listofabbrevstrue}
\newcommand{\showlistofacronyms}{\@umich@listofacronymstrue}
\newcommand{\showlistofsymbols}{\@umich@listofsymbolstrue}

% Commands to hide each of the lists
\newcommand{\hidelistoffigures}{\@umich@listoffiguresfalse}
\newcommand{\hidelistoftables}{\@umich@listoftablesfalse}
\newcommand{\hidelistofmaps}{\@umich@listofmapsfalse}
\newcommand{\hidelistofillustrations}{\@umich@listillustrationsfalse}
\newcommand{\hidelistofprograms}{\@umich@listofprogramsfalse}
\newcommand{\hidelistofappendices}{\@umich@listofappendicesfalse}
\newcommand{\hidelistofabbreviations}{\@umich@listofabbrevsfalse}
\newcommand{\hidelistofacronyms}{\@umich@listofacronymsfalse}
\newcommand{\hidelistofsymbols}{\@umich@listofsymbolsfalse}


%% ---- TENTS ----------------------------------------------

% This sets the formatting for frontchapter entries in the table of contents.
\newcommand*{\l@frontchapter}[2]{
 % First add some vertical space.
 \vskip 1ex plus 1pt minus 1pt
 % Format the spacing and use dots between title and number.
 \@dottedtocline{1}{0em}{1.0em} %
 % Add a bookmark manually for the table of contents.
 %\pdfbookmark[0]{#1}{\thepage} %
 % This sets the formatting for the chapter name and page number.
 {\uppercase{#1}}{#2} %
 % Add some space below, too.
 \vskip 1ex}

% This sets the formatting for chapter entries in the table of contents.
\renewcommand*\l@chapter[2]{ %
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
\newcommand*{\l@backchapter}[2]{ %
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
 \if@umich@thesis %
  \begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 \fi %
 % Add the title
 \centerline{\large\bf TABLE OF CONTENTS} %
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
 % Larger upper margin for first page of table (thesis only)
 \if@umich@thesis %
  \begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 \fi %
 % Add the title
 \centerline{\large\bf LIST OF FIGURES} %
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
 % Larger upper margin for first page of table (thesis only)
 \if@umich@thesis %
  \begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 \fi %
 % Add the title
 \centerline{\large\bf LIST OF TABLES} %
 % Add some space after the title.
 \vspace{1ex} %
 % Start the automatic table of contents features.
 \begin{singlespace} %
  \@starttoc{lot}\if@restonecol\twocolumn\fi %
 \end{singlespace} %
 \addtocontents{lot}{\hbox{TABLE}}
}


%% ---- LIST OF MAPS ---------------------------------------------------
% Command to generate the 'map' environment.
\newfloat{map}{tbp}{lom}[chapter]
% Use a capitalized version for the captions.
\floatname{map}{Map}

% This sets the formatting for map entries in the list of maps.
\newcommand*{\l@map}{\@dottedtocline{1}{0em}{2.5em}}

% This sets the formatting of the list of maps page.
\newcommand*{\listofmaps}{%
 % Move to new page.
 \newpage %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{frontchapter}{List of Maps} %
 % Use front page styling.
 \frntpg %
 % Larger upper margin for first page of table (thesis only)
 \if@umich@thesis %
  \begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 \fi %
 % Add the title
 \centerline{\large\bf LIST OF MAPS} %
 % Add some space after the title.
 \vspace{1ex} %
 % Start the automatic table of contents features.
 \begin{singlespace} %
  \@starttoc{lom}\if@restonecol\twocolumn\fi %
 \end{singlespace} %
 \addtocontents{lom}{\hbox{MAP}}
}


%% ---- LIST OF ILLUSTRATIONS ------------------------------------------
% Command to generate the 'illustration' environment.
\newfloat{illustration}{tbp}{loi}[chapter]
% Use a capitalized version for the captions.
\floatname{illustration}{Illustration}

% This sets the formatting for map entries in the list of maps.
\newcommand*{\l@illustration}{\@dottedtocline{1}{0em}{2.5em}}

% This sets the formatting of the list of maps page.
\newcommand*{\listofillustrations}{%
 % Move to new page.
 \newpage %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{frontchapter}{List of Illustrations} %
 % Use front page styling.
 \frntpg %
 % Larger upper margin for first page of table (thesis only)
 \if@umich@thesis %
  \begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 \fi %
 % Add the title
 \centerline{\large\bf LIST OF ILLUSTRATIONS} %
 % Add some space after the title.
 \vspace{1ex} %
 % Start the automatic table of contents features.
 \begin{singlespace} %
  \@starttoc{loi}\if@restonecol\twocolumn\fi %
 \end{singlespace} %
 \addtocontents{loi}{\hbox{ILLUSTRATION}}
}


%% ---- LIST OF PROGRAMS -----------------------------------------------
% Command to generate the 'map' environment.
\newfloat{program}{tbp}{lop}[chapter]
% Use a capitalized version for the captions.
\floatname{program}{Program}

% This sets the formatting for map entries in the list of maps.
\newcommand*{\l@program}{\@dottedtocline{1}{0em}{2.5em}}

% This sets the formatting of the list of maps page.
\newcommand*{\listofprograms}{%
 % Move to new page.
 \newpage %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{frontchapter}{List of Programs} %
 % Anchor for pdf
 \phantomsection %
 % Use front page styling.
 \frntpg %
 % Larger upper margin for first page of table (thesis only)
 \if@umich@thesis %
  \begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 \fi %
 % Add the title
 \centerline{\large\bf LIST OF PROGRAMS} %
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
 % Larger upper margin for first page of table (thesis only)
 \if@umich@thesis %
  \begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 \fi %
 % Add the title
 \centerline{\large\bf LIST OF APPENDICES} %
 % Add some space after the title.
 \vspace{1ex} %
 % Start the automatic table of contents features.
 \begin{singlespace} %
  \@starttoc{loa}\if@restonecol\twocolumn\fi %
 \end{singlespace} %
}

% Renew the command that starts the appendices.
\renewcommand{\appendix}{ %
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
\def\@chapter@appendix[#1]#2{ %
 % Increase the chapter letter.
 \refstepcounter{chapter} %
 % Print a line to the .log file.
 \typeout{\@chapapp\space\thechapter.} %
 % Hopefully this works.
 \phantomsection %
 % Add a bookmark manually.
 \pdfbookmark[0]{#1}{#2} %
 % Add sections to the table of contents.
 \addtocontents{loa}{\setcounter{tocdepth}{1}} %
 % Add to the list of appendices rather than toc.
 \addcontentsline{loa}{chapter}{\protect\numberline{\thechapter}\space#1} %
 % Save the chapter number.
 \chaptermark{#1} %
 % Add extra space to the lists of figures and tables and maps.
 \addtocontents{lof}{\protect\addvspace{8pt}} %
 \addtocontents{lot}{\protect\addvspace{8pt}} %
 \addtocontents{lom}{\protect\addvspace{8pt}} %
 \addtocontents{lop}{\protect\addvspace{8pt}} %
 \addtocontents{loi}{\protect\addvspace{8pt}} %
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
  % Add a bookmark manually.
  \pdfbookmark[1]{#1}{#1} %
  % Add to list of appendices
  \addcontentsline{loa}{section}{#1}
  % Save the section number
  \sectionmark{#1}
  % Issue the start section command
  \@startsection{section} % Use the default formatting settings
    {1} %
    {0pt} %
    {-3.5ex plus -1ex minus -0.2ex} %
    {2.3ex plus 0.2ex} %
    {\normalfont\Large\bfseries}
    {#1} % Add the section title text
  }


%% ---- LIST OF ABBREVIATIONS ------------------------------------------
% Variable holding the contents of the abbreviations.
\newcommand{\@abbrevs}{}

% Command to set the abbreviations.
\newcommand{\abbreviations}[1]{ %
 % Show the list of abbreviations.
 \@umich@listofabbrevstrue %
 % Redefine the list.
 \renewcommand{\@abbrevs}{#1}}

% This sets the formatting for the abbreviations.
\newcommand*{\l@abbreviation}{\@dottedtocline{1}{0em}{2.5em}}

% This sets the formatting of the list of tables page.
\newcommand*{\listofabbreviations}{%
 % Move to new page.
 \newpage %
 % Add this page to the table of contents.
 \phantomsection\addcontentsline{toc}{frontchapter}{List of Abbreviations} %
 % Use front page styling.
 \frntpg %
 % Larger upper margin for first page of table (thesis only)
 \if@umich@thesis %
  \begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 \fi %
 % Add the title
 \centerline{\large\bf LIST OF ABBREVIATIONS} %
 % Add some space after the title.
 \vspace{1ex} %
 % Start the automatic abbreviations feature.
 \begin{singlespace} %
  \begin{acronym} %
   \@abbrevs %
  \end{acronym} %
 \end{singlespace} %
}


%% ---- LIST OF ACRONYMS -----------------------------------------------
% Variable holding the contents of the abbreviations.
\newcommand{\@acronyms}{}

% Command to set the abbreviations.
\newcommand{\acronyms}[1]{ %
 % Show the list of abbreviations.
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
 % Larger upper margin for first page of table (thesis only)
 \if@umich@thesis %
  \begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 \fi %
 % Add the title
 \centerline{\large\bf LIST OF ACRONYMS} %
 % Add some space after the title.
 \vspace{1ex} %
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
\newcommand{\symbols}[1]{ %
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
 % Larger upper margin for first page of table (thesis only)
 \if@umich@thesis %
  \begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 \fi %
 % Add the title
 \centerline{\large\bf LIST OF SYMBOLS} %
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
\if@umich@thesis
 \@abstract@pagenotrue
\fi

% Command to hide abstract page number
\newcommand{\hideabstractpagenumber}{ %
 \@abstract@pagenofalse}
% Command to show abstract page number
\newcommand{\showabstractpagenumber}{ %
 \@abstract@pagenotrue}

% Format the abstract page.
\newcommand{\abstractpage}{ %
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
 \begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 % Center the title area.
 \begin{center} %
  % Formatting
  \large \bfseries
  % Add the heading.
  ABSTRACT \\[2ex] %
%  % Add the title of the dissertation.
%  \normalsize %
%  \inserttitle \\[2ex] %
%  % Add the word 'by'
%  by \\[2ex]
%  % Add the author.
%  \insertauthor
 \end{center} %
% % Vertical rubber space
% \vspace*{\stretch{2}} %
% % Insert the chair info
% \ifthenelse{\equal{\@cochair}{}}{
%  % No co-chairs; insert the chair.
%  {\bf Chair: \insertchair} %
% }{ %
%  % Use co-chairs.
%  {\bf Co-Chairs: \insertcochair}} %
% % Vertical rubber space
% \vspace*{\stretch{2}} %
% \newline
 % Insert the abstract text.
 \onehalfspacing %
 % Insert the text.
 \insertabstract %
 % Vertical rubber space
 \vspace*{\stretch{1}} %
}


%% ---- BIBLIOGRAPHY ---------------------------------------------------
% Save the original bibliography command.
\let\@tex@bibliography\bibliography

% Change the bibliography header.
\renewcommand*{\bibname}{\centerline{\large BIBLIOGRAPHY}}

% Create a new command for the bibliography.
\renewcommand*{\bibliography}[1]{ %
 % Update the page format.
 \if@umich@report %
  % Eliminate vertical space.
  \ \\[-2ex] %
 \else %
  % Switch to single spacing
  \singlespacing %
 \fi %
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

% Formatting commands
% This command is used for names of files
\newcommand{\tfile}[1]{{\footnotesize\textsf{#1}}}
% This command puts a box around text that is meant for menu entries.
\newcommand{\tmenu}[1]{\framebox[\width]{\ {\tiny\textsf{#1}}\ }}
% This command is intended for names of variables within programs.
\newcommand{\tvar}[1]{{\footnotesize\texttt{#1}}}
% This command is used to display the contents of strings.
% It automatically adds the correct, upright quotes around the argument.
\newcommand{\tstring}[1]{ %
 {\footnotesize\texttt{\textquotesingle#1\textquotesingle}}}
% This command gives a bold version of the variable names.
\newcommand{\tfunction}[1]{{\footnotesize\texttt{\textbf{#1}}}}



%% ---- CHAPTER HEADINGS -----------------------------------------------
% Change the chapter headings to uppercase.
\renewcommand{\@chapapp}{CHAPTER}

% Change the formatting of the first page of each chapter.
\renewcommand{\@makechapterhead}[1]{%
 % Insert an extra top margin.
 \begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 % Insert the text
 { %
  % Ensure proper alignment.
  \parindent 0pt \raggedright %
  % Check for chapter overflow.
  \ifnum \c@secnumdepth >\m@ne %
   % CHAPTER and number
   \centerline{\Large\bf \@chapapp{} \thechapter} \par %
   % Vertical space
   \vskip 0.3in \fi %
   % Insert the title of the chapter.
   \begin{center} \LARGE\bf #1 \end{center} %
   % Vertical space after the title
   \nobreak \vskip 0.3in %
 } %
}


%% ---- SPACING --------------------------------------------------------
% This fixes the spacing below captions, which by default can be small.
\setlength\belowcaptionskip{7pt plus 4pt minus 1pt}



%% ---- LINKS ----------------------------------------------------------
% This loads a package that allows extra colors for links.
\RequirePackage[usenames,dvipsnames]{xcolor}
% Custom color for references.
\definecolor{DarkGreen}{rgb}{0,0.6,0}

% This will make labels and references hyperlinks.
\if@umich@backref
 % Use references in the bibliography.
 \RequirePackage[pagebackref=true]{hyperref}
\else
 % Do not use back references.
 \RequirePackage{hyperref}
\fi

% This controls some settings that affect the appearance of links.
\if@umich@thesis
 % Use black for the main links.
 \hypersetup{ %
  colorlinks=true, %
  pdfstartview={FitH}, %
  citecolor=Black, %
  linkcolor=Black, %
  urlcolor=Blue %
 }
\else
 % Use maroon for the main links.
 \hypersetup{ %
  colorlinks=true, %
  pdfstartview={FitH}, %
  citecolor=DarkGreen, %
  linkcolor=Maroon, %
  urlcolor=Blue %
 }
\fi


%% ---- INITIALIZATION -------------------------------------------------
% Commands to be placed after \begin{document}
\AtBeginDocument{ %
 % Insert a title page.
 \titlepage %
 % Change the PDF title.
 \hypersetup{pdftitle=\inserttitle} %
 % Insert the frontispiece if there is one.
 \if@umich@frontispiece\frontispiecepage\fi %
% \ifthenelse{\equal{\@frontispiece}{}}{}{\frontispiecepage} %
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
 % Insert the foreword if there is one.
 \if@umich@foreword\forewordpage\fi %
 % Insert the prologue if there is one.
 \if@umich@prologue\prologuepage\fi %
 % Insert the table of contents.
 \tableofcontents %
 % Insert the list of figures.
 \if@umich@listoffigures\listoffigures\fi %
 % Insert the list of tables.
 \if@umich@listoftables\listoftables\fi %
 % Insert the list of maps.
 \if@umich@listofmaps\listofmaps\fi %
 % Insert the list of illustrations.
 \if@umich@listofillustrations\listofillustrations\fi %
 % Insert the list of programs.
 \if@umich@listofprograms\listofprograms\fi %
 % Insert the list of appendices.
 \if@umich@listofappendices\listofappendices\fi %
 % Insert the list of abbreviations.
 \if@umich@listofabbrevs\listofabbreviations\fi %
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
 % Use the correct formatting.
 \if@umich@thesis %
  % Use 1.5 spacing
  \onehalfspacing %
 \else %
  % Use two-column format
  \twocolumn %
 \fi %
}

