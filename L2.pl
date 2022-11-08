%swipl -g "['L2'], verify('input.txt')" -g halt

verify(InputFileName) :- see(InputFileName),
read(Prems), read(Goal), read(Proof),
seen,
valid_proof(Prems, Goal, Proof).

% big chungus

% Check impel ------------------------------
% 4. Check the first slot of the imp is valid, e.g if LineNumber is correct and the result on that place is correct.
impelFirstSlot([[LineNumber, X, _]|_], LineNumber, X).

% 3. Iterate
impelFirstSlot([_|Rest], LineNumber, X) :- impelFirstSlot(Rest, LineNumber, X).

% 2. When the line number matches and there is an imp(A, B) then check that the result matches and check that A is valid
impelSecondSlot(AllLines, [[B, imp(X, Result), _]|Rest], Result, A, B) :- impelFirstSlot(AllLines, A, X).

% 1. Iterate
impelSecondSlot(AllLines, [_|Rest], Result, A, B) :- impelSecondSlot(AllLines, Rest, Result, A, B).
% ---------------------------------------------


% 0: List of premises
% 1: The Goal
% 2: All Lines

% 3: The Line Number (left)
% 4: The result (middle)
% 5: How the result was made (right)
valid_line([], _, _, _, _, _).

% Check validity of premise ------------------------------
valid_line([Premise|OtherPremises], _, _, _, Premise, premise).
valid_line([Prems|OtherPremises], _, _, _, Premise, premise) :- valid_line(OtherPremises, _, _, _, Premise, premise).

% Check validity of impel ------------------------------
valid_line(_, _, AllLines, _, Result, impel(A, B)) :- impelSecondSlot(AllLines, AllLines, Result, A, B).
% ---------------------------------------------

readLine(_, _, _, []).
readLine(Prems, Goal, AllLines, [[A,B,C]|Rest]) :- write(A), write(" "), write(B), write(" "), write(C), write("\n"),
    readLine(Prems, Goal, AllLines, Rest), valid_line(Prems, Goal, AllLines, A, B, C).

valid_proof(Prems, Goal, Line) :- readLine(Prems, Goal, Line, Line).
