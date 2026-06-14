\ProvidesClass{plantilla_proyecto}[2015/05/04 v1 Plantilla del documento LaTeX]
%
% Opciones
%
\newif\iflisttables\listtablesfalse
\newif\iflistfigures\listfiguresfalse
\newif\iflistlistings\listlistingsfalse
\newif\iflistquadres\listquadresfalse

\DeclareOption{spanish}{\PassOptionsToPackage{main=spanish}{babel}}

\DeclareOption{listoftables}{\listtablestrue}
\DeclareOption{listoffigures}{\listfigurestrue}
\DeclareOption{listoflistings}{\listlistingstrue}
\DeclareOption{listofquadres}{\listquadrestrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions

\LoadClass{book}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Codificación de caracteres
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[T1]{fontenc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Configuración de Babel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{babel}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tipografía base (Palatino)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{mathpazo}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Geometría de página
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[a4paper,left=3cm,right=3cm,top=2.35cm,bottom=2.35cm]{geometry}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Escritura de los enlaces de internet; ejemplo: \url{www.upv.es}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{url}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tocbibind}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Manejo de colores
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{xcolor}

%%%%%%%%%%%%%%%%%%
% Colores para los listados de código
%%%%%%%%%%%%%%%%%%
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

%%%%%%%%%%%%%%%%
% Tonos grises para la portada
%%%%%%%%%%%%%%%%
\definecolor{grisclar}{gray}{0.5}
\definecolor{grisfosc}{gray}{0.25}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Para evitar lÃ­neas huÃ©rfanas y viudas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\clubpenalty=10000
\widowpenalty=10000


%%%%%%%
% Datos generales del documento
%%%%%%%

\newcommand{\tutor}[1]{\newcommand{\t@tor}{#1}}
\newcommand{\curs}[1]{\newcommand{\c@rs}{#1}}
\newcommand{\teamcode}[1]{\gdef\t@eamcode{#1}}
\newcommand{\contactinfo}[1]{\gdef\c@ntactinfo{#1}}
\newcommand{\coverdate}[1]{\gdef\c@verdate{#1}}

\newcommand{\titulacioname}{Grado en Inform\'atica Industrial y Rob\'otica}
\newcommand{\tfgname}{Redes Industriales}

\newcommand{\authorname}{Autores}
\newcommand{\teamcodename}{Equipo}
\newcommand{\contactinfoname}{Contacto}
\newcommand{\coverdatename}{Fecha}
\newcommand{\tutorname}{Profesor}
\newcommand{\coursename}{Curso}
\newcommand{\keywordsname}{Palabras clave}

\newcommand{\algorithmname}{Algoritmo}
\newcommand{\listalgorithmname}{\'Indice de algoritmos}
\newcommand{\quadrename}{Cuadro}
\newcommand{\listquadrename}{\'Indice de cuadros}

\newcommand{\appendicesname}{Ap\'endices}

\addto\captionsspanish{%
     \renewcommand{\titulacioname}{Grado en Inform\'atica Industrial y Rob\'otica}
     \renewcommand{\tfgname}{Redes Industriales}
     \renewcommand{\authorname}{Autores}
     \renewcommand{\teamcodename}{Equipo}
     \renewcommand{\contactinfoname}{Contacto}
     \renewcommand{\coverdatename}{Fecha}
     \renewcommand{\tutorname}{Profesor}
     \renewcommand{\coursename}{Curso}
     \renewcommand{\keywordsname}{Palabras clave}
     \renewcommand{\tablename}{Tabla}
     \renewcommand{\listtablename}{\'Indice de tablas}
     \renewcommand{\lstlistingname}{C\'odigo}
     \renewcommand{\lstlistlistingname}{\'Indice de c\'odigos}
     \renewcommand{\quadrename}{Cuadro}
     \renewcommand{\listquadrename}{\'Indice de cuadros}
     \renewcommand{\appendicesname}{Ap\'endices}}
     

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nuevos tipos de objetos flotantes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Formato de los títulos de tablas, figuras, etc.
% Líneas centradas, tamaño "small" para etiqueta y texto,
% y la etiqueta en negrita
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[justification=centerlast,small,bf,labelsep=colon]{caption}
\RequirePackage{booktabs}
\RequirePackage{tabularx}

\RequirePackage{algorithmic}
\RequirePackage[within=chapter]{newfloat}

\DeclareFloatingEnvironment[fileext=loa,
     listname=\listalgorithmname,name=\algorithmname]{algorithm}
     \DeclareCaptionFormat{ruled}{\hrulefill\par#1#2#3\vspace{-.5\baselineskip}\hrulefill}
\captionsetup[algorithm]{justification=raggedright,singlelinecheck=off,position=below,format=ruled}  
   
\DeclareFloatingEnvironment[fileext=loq,
     listname=\listquadrename,name=\quadrename]{quadre}     
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Estilo para mostrar código fuente
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{listings}

\lstset{ %
     language=C++,					% lenguaje del código
     basicstyle=\footnotesize,		% tamaño base de la fuente
     numbers=left,                   % posición de la numeración de líneas
     numberstyle=\footnotesize,      % tamaño de la numeración de líneas
     stepnumber=1,                   % numerar todas las líneas
     numbersep=5pt,                  % separación entre números y código
     backgroundcolor=\color{white},	% color de fondo
     numberstyle=\tiny\color{gray},	% color de los números de línea
     keywordstyle=\color{blue},		% color de las palabras clave
     commentstyle=\color{dkgreen},	% color de los comentarios
     stringstyle=\color{mauve}, 		% color de las cadenas
     showspaces=false,               % no mostrar espacios visibles
     showstringspaces=false,         % no subrayar espacios en cadenas
     showtabs=false,                 % no marcar tabulaciones
     frame=single,          			% añadir un marco al código
     tabsize=2,          			% tamaño de tabulación
     captionpos=b,           		% posición inferior del título
     breaklines=true,        		% permitir salto automático de línea
     breakatwhitespace=false,   		% no limitar los saltos a espacios
     escapeinside={\%*}{*)}          % permitir insertar comentarios LaTeX en el código
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Formato de los títulos de \chapter y \section,
% con punto tras la numeración de las secciones
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{titlesec}

\titlelabel{\thetitle.\quad}

\titleformat{\chapter}[display]
{\normalfont\Large\filleft\sffamily\bfseries}  % FORMAT
{\titlerule[1pt]                                  
 \vspace{1pt}
 \titlerule
 \vspace{1pc}
 \LARGE\MakeUppercase{\chaptertitlename} \thechapter} % LABEL
{0pc}                                                 % SEP
{\Huge}                                               % código antes del título
[\vspace{5pt}{\titlerule[1pt]}]                      % código después del título

\titleformat{\section}
 {\Large\normalfont\sffamily\bfseries}
 {\thesection}{0.5em}{}[\hrule height1.5pt]
%


\RequirePackage{tocloft}
%
\setlength{\cftbeforechapskip}{3pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definición de cabeceras y pies de página
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{fancyhdr}

\pagestyle{fancy}
\setlength{\headheight}{16pt}
%\renewcommand*{\headheight}{14pt}
\renewcommand*{\headrulewidth}{1.2pt}

\renewcommand{\chaptermark}[1]{\markboth{{\sffamily\mdseries\normalsize\hspace{1em} #1}}{}}
\renewcommand{\sectionmark}[1]{\markright{{\sffamily\mdseries\normalsize\thesection\hspace{0.5em} #1}}{}}

\lhead[\bfseries\thepage]{\sffamily\rightmark}
\rhead[\sffamily\leftmark]{\bfseries\thepage}
\cfoot{} 
\lfoot{}
\rfoot{}


\RequirePackage{graphicx}
\RequirePackage{eso-pic}


%%%%%%%%%%%%%%
% Enlaces navegables
%%%%%%%%%%%%%

\RequirePackage[colorlinks]{hyperref}
\hypersetup{
    colorlinks=true, 
    linkcolor=black, 
    urlcolor=cyan
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Separación entre párrafos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\parskip}{1ex}

\newcommand{\foreign}[2]{\foreignlanguage{#1}{\textit{#2}}}
     
\newenvironment{Foreign}[1]{\begin{quote}\itshape\selectlanguage{#1}}{\end{quote}}     
      
%%%%%%%%
% Resumen
%%%%%%%%

\newcommand{\storedkeywords}{}
\newcommand{\keywords}[1]{\gdef\storedkeywords{#1}}

\newenvironment{abstract}[1][spanish]{%
                    \begingroup
                         \thispagestyle{plain}%
                         \markboth{}{}%
                         \selectlanguage{#1}\addvspace{\baselineskip}\par\hfill
                         {\sffamily\bfseries\Huge\abstractname}\smallskip\par}{%
                \par\nopagebreak\noindent\textbf{\keywordsname:} \storedkeywords\vspace*{3pt}\hrule
                                        \endgroup\par\vspace{\stretch{1}}}


%%%%%%%%%
% Índices
%%%%%%%%%
\newcommand{\makeindexes}{\cleardoublepage\tableofcontents\cleardoublepage
                          \iflistfigures\listoffigures\fi
                          \iflisttables\listoftables\fi
                          \iflistlistings\lstlistoflistings\fi
                          \iflistquadres\listofquadres\fi
                          \markboth{}{}
                          \addtocontents{toc}{\protect\noindent\protect\hrulefill\protect\par}
                          \cleardoublepage}

\setlength{\cftaftertoctitleskip}{\baselineskip}
\setlength{\cftafterloftitleskip}{\baselineskip}
\setlength{\cftafterlottitleskip}{\baselineskip}

\renewcommand{\cfttoctitlefont}{\hfill\Huge\sffamily\bfseries}
\renewcommand{\cftlottitlefont}{\hfill\Huge\sffamily\bfseries}
\renewcommand{\cftloftitlefont}{\hfill\Huge\sffamily\bfseries}

\renewcommand{\cftaftertoctitle}{\par\noindent\hrulefill}
\renewcommand{\cftafterlottitle}{\par\noindent\hrulefill}
\renewcommand{\cftafterloftitle}{\par\noindent\hrulefill}

\newcommand{\APPENDIX}{\appendix
             \phantomsection
             \addtocontents{toc}{\protect\noindent\protect\hrulefill\protect\par}             
             \ifnum\value{appendix}=1 \addtocontents{toc}{\protect\appendixname\protect\par}
                    \else\addtocontents{toc}{\protect\appendicesname\protect\par}\fi}

\newcommand{\m@ketitle}{%
\begin{titlepage}
\AddToShipoutPicture*{\put(0,500){\includegraphics[width=21cm,height=12.89cm]{assets/portada/decor_arriba.pdf}}}
\AddToShipoutPicture*{\put(0,0){\includegraphics[width=21cm,height=12.89cm]{assets/portada/decor_abajo.pdf}}}
\AddToShipoutPicture*{\AtPageUpperLeft{%
     % Márgenes: superior, izquierda y derecha de 2 cm
     \raisebox{-6cm}{\hspace{3cm}\includegraphics[height=2cm]{assets/portada/logo-upv.pdf}% tamaño original 116 mm x 37 mm escalado a 62.7 mm x 20 mm
    \hspace{0.5cm}% 21cm-(2+6.27+5.19+2)cm
                                      \includegraphics[height=2cm]{assets/portada/logo-etsinf.pdf}}% tamaño original 109 mm x 42 mm escalado a 51.9 mm x 20 mm
                    }}
%\centering
\vspace*{3.2cm}
\begin{color}{grisfosc}
\large
Escuela Técnica Superior de Ingeniería Informática

Universidad Politécnica de Valencia
\end{color}

\vspace{0.4cm}
\centering

\LARGE\bfseries\@title

\vspace{0.5cm}

\large\scshape \tfgname
\par\vspace{0.3cm}\par
\normalfont\textcolor{grisclar}{\titulacioname}

\vspace{0.4cm}
\normalfont\textcolor{grisclar}{\small Curso 2025--2026}

\vspace{0.25cm}

% Autores y profesor
\begin{flushright}
\begin{tabular}[t]{@{}l@{}}
    \textbf{\authorname:} \\[0.2cm]
    \begin{tabular}[t]{@{}l@{}}\@author\end{tabular} \\[0.5cm]
    \textbf{\tutorname:} \t@tor
\end{tabular}
\end{flushright}
\end{titlepage}}

\renewcommand{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\AtBeginDocument{%
    \frontmatter\m@ketitle\cleardoublepage\thispagestyle{plain}}

\newcounter{appendix}
\AtEndDocument{%
    \ifnum\value{chapter}=1 
           \immediate\write\@auxout{\unexpanded{\setcounter{appendix}{1}}}
    \else 
           \immediate\write\@auxout{\unexpanded{\setcounter{appendix}{2}}} \fi}