import() :- ['rules/*'].

% START ------------------------------------------------------

verify(InputFileName) :- import(), see(InputFileName),
read(Prems), read(Goal), read(Proof),
seen,
valid_proof(Prems, Goal, Proof).

%-------------------------------------------------------------



% READLINE -------------------------------------------------------------------------------------------------------------------

readLine(_, _, _, []).


writeLine(A, B, C) :- write(A), write(" "), write(B), write(" "), write(C), write("\n").

% When a sublist is reached then it should always be an assumption
readLine(Prems, Goal, AllLines,
    [[[A, B, assumption]|Rest]|OuterRest]) :-
        writeLine(A, B, assumption),
        readLine(Prems, Goal, AllLines, Rest), 
        readLine(Prems, Goal, AllLines, OuterRest).

readLine(Prems, Goal, AllLines, [[A,B,C]|Rest]) :- writeLine(A, B, C),
    readLine(Prems, Goal, AllLines, Rest), valid_line(Prems, Goal, AllLines, A, B, C).

valid_proof(Prems, Goal, Line) :- readLine(Prems, Goal, Line, Line).

% -----------------------------------------------------------------------------------------------------------------------------



% VALID LINE ------------------------------------------------------------------------------------------------------------------------------------------

% Arguments for valid line
% 0: List of premises
% 1: The Goal
% 2: All Lines
% 3: (A) The Line Number (left)
% 4: (B) The result (middle)
% 5: (C) How the result was made (right)

% Check validity of ...

% premise 
valid_line(Prems, _, _, _, Premise, premise) :- valid_premise(Prems, Premise).

% impel 
valid_line(_, _, AllLines, _, Result, impel(FirstLine, SecondLine)) :- impelSecondSlot(AllLines, AllLines, Result, FirstLine, SecondLine).

% negel 
valid_line(_, _, AllLines, _, cont, negel(FirstLine, SecondLine)) :- negelFirstSlot(AllLines, AllLines, FirstLine, SecondLine).

% copy 
valid_line(_, _, AllLines, _, Result, copy(LineNumber)) :- valid_copy(AllLines, Result, LineNumber).

% andint
valid_line(_, _, AllLines, _, Result, andint(FirstLine, SecondLine)) :- valid_andint(AllLines, Result, FirstLine, SecondLine).

% andel1
valid_line(_, _, AllLines, _, Result, andel1(LineNumber)) :- valid_andel1(AllLines, Result, LineNumber).

% andel2
valid_line(_, _, AllLines, _, Result, andel2(LineNumber)) :- valid_andel2(AllLines, Result, LineNumber).



% -----------------------------------------------------------------------------------------------------------------------------------------------------