import() :- ['rules/*', 'utils/*'].

% START ------------------------------------------------------

verify(InputFileName) :- import(), see(InputFileName),
read(Prems), read(Goal), read(Proof),
seen,
valid_proof(Prems, Goal, Proof).

%-------------------------------------------------------------



% READLINE -------------------------------------------------------------------------------------------------------------------

% Arguments for readLine
% 0: List of premises
% 1: The Goal
% 2: All Lines
% 3: Traversed lines (including same and higher level assumptions)
% 4: Current Line


writeLine(A, B, C) :- write(A), write(" "), write(B), write(" "), write(C), write("\n").

% return when theres no more lines
readLine(_, _, _, _, []).

% When a sublist is reached then it should always be an assumption
readLine(Prems, Goal, AllLines, TraversedLines,
    [[[A, B, assumption]|Rest]|OuterRest]) :-
        % Print
        writeLine(A, B, assumption),
        
        % Append the assumption line to your TraversedLines
        appendEl([A,B,assumption], TraversedLines, InnerTraversed),
        % Continue reading from within the assumption
        readLine(Prems, Goal, InnerTraversed, AllLines, Rest),

        % Append the whole assumption list to your TraversedLines
        appendEl([[A,B,assumption]|Rest], TraversedLines, OuterTraversed),
        % Continue reading lines after the assumption
        readLine(Prems, Goal, AllLines, OuterTraversed, OuterRest).

readLine(Prems, Goal, AllLines, TraversedLines, [[A,B,C]|Rest]) :- writeLine(A, B, C),
    % Add the line to your visited lines
    appendEl([A,B,C], TraversedLines, AllTraversed),
    % Read the nex line
    readLine(Prems, Goal, AllLines, AllTraversed, Rest),
    % Make sure the line is valid
    valid_line(Prems, Goal, AllLines, TraversedLines, A, B, C).

% start reading all lines, with an empty traversed lines list
valid_proof(Prems, Goal, Line) :- readLine(Prems, Goal, Line, [], Line).

% -----------------------------------------------------------------------------------------------------------------------------



% VALID LINE ------------------------------------------------------------------------------------------------------------------------------------------

% Arguments for valid line
% 0: List of premises
% 1: The Goal
% 2: All Lines
% 2: Traversed lines (not including the current one)
% 3: (A) The Line Number (left)
% 4: (B) The result (middle)
% 5: (C) How the result was made (right)

% Check validity of ...

% premise 
valid_line(Prems, _, _, _, _, Premise, premise) :- valid_premise(Prems, Premise).

% impel 
valid_line(_, _, AllLines, _, _, Result, impel(FirstLine, SecondLine)) :- impelSecondSlot(AllLines, AllLines, Result, FirstLine, SecondLine).

% negel 
valid_line(_, _, _, TraversedLines, _, cont, negel(FirstLine, SecondLine)) :- negelFirstSlot(TraversedLines, TraversedLines, FirstLine, SecondLine).

% copy 
valid_line(_, _, AllLines, _, _, Result, copy(LineNumber)) :- valid_copy(AllLines, Result, LineNumber).

% andint
valid_line(_, _, AllLines, _, _, Result, andint(FirstLine, SecondLine)) :- valid_andint(AllLines, Result, FirstLine, SecondLine).

% andel1
valid_line(_, _, AllLines, _, _, Result, andel1(LineNumber)) :- valid_andel1(AllLines, Result, LineNumber).

% andel2
valid_line(_, _, AllLines, _, _, Result, andel2(LineNumber)) :- valid_andel2(AllLines, Result, LineNumber).

% orint1
valid_line(_, _, AllLines, _, _, Result, orint1(LineNumber)) :- valid_orint1(AllLines, Result, LineNumber).



% -----------------------------------------------------------------------------------------------------------------------------------------------------