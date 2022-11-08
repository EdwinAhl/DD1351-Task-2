import() :- ['rules/*'].

% START ------------------------------------------------------

verify(InputFileName) :- import(), see(InputFileName),
read(Prems), read(Goal), read(Proof),
seen,
valid_proof(Prems, Goal, Proof).

%-------------------------------------------------------------



% READLINE -------------------------------------------------------------------------------------------------------------------
readLine(_, _, _, []).
readLine(Prems, Goal, AllLines, [[A,B,C]|Rest]) :- write(A), write(" "), write(B), write(" "), write(C), write("\n"),
    readLine(Prems, Goal, AllLines, Rest), valid_line(Prems, Goal, AllLines, A, B, C).

valid_proof(Prems, Goal, Line) :- readLine(Prems, Goal, Line, Line).

% -----------------------------------------------------------------------------------------------------------------------------



% VALID LINE ------------------------------------------------------------------------------------------------------------------------------------------

% 0: List of premises
% 1: The Goal
% 2: All Lines

% 3: The Line Number (left)
% 4: The result (middle)
% 5: How the result was made (right)

% Check validity of premise ------------------------------
valid_line(Prems, _, _, _, Premise, premise) :- valid_premise(Prems, Premise).

% Check validity of impel ------------------------------
valid_line(_, _, AllLines, _, Result, impel(A, B)) :- impelSecondSlot(AllLines, AllLines, Result, A, B).

% Check validity of negel ------------------------------
valid_line(_, _, AllLines, _, cont, negel(A, B)) :- negelFirstSlot(AllLines, AllLines, A, B).

% -----------------------------------------------------------------------------------------------------------------------------------------------------