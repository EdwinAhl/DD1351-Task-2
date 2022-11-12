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

readLine(_, _, _, _, []).

% When a sublist is reached then it should always be an assumption
readLine(Prems, Goal, AllLines, TraversedLines,
    [[[A, B, assumption]|Rest]|OuterRest]) :-
        writeLine(A, B, assumption),

        appendEl([A,B,assumption], TraversedLines, InnerTraversed),
        readLine(Prems, Goal, InnerTraversed, AllLines, Rest),

        appendEl([[A,B,assumption]|Rest], TraversedLines, OuterTraversed),
        readLine(Prems, Goal, AllLines, OuterTraversed, OuterRest).

readLine(Prems, Goal, AllLines, TraversedLines, [[A,B,C]|Rest]) :- writeLine(A, B, C),
    appendEl([A,B,C], TraversedLines, AllTraversed),
    readLine(Prems, Goal, AllLines, AllTraversed, Rest),
    valid_line(Prems, Goal, AllLines, TraversedLines, A, B, C).

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
valid_line(_, _, AllLines, TraversedLines, _, cont, negel(FirstLine, SecondLine)) :- negelFirstSlot(TraversedLines, TraversedLines, FirstLine, SecondLine).

% copy 
valid_line(_, _, AllLines, _, _, Result, copy(LineNumber)) :- valid_copy(AllLines, Result, LineNumber).

% andint
valid_line(_,_, AllLines, _, _, Result, andint(FirstLine, SecondLine)) :- valid_andint(AllLines, Result, FirstLine, SecondLine).



% -----------------------------------------------------------------------------------------------------------------------------------------------------