% CHECK IMPEL --------------------------------------------------------------------------------------------------------------------------------

% 4. Check the the first slot of the imp is valid, e.g if LineNumber is correct and the result on that place is correct.
impelFirstSlot([[LineNumber, X, _]|_], LineNumber, X).

% 3. Iterate
impelFirstSlot([_|Rest], LineNumber, X) :- impelFirstSlot(Rest, LineNumber, X).

% 2. When the line number matches and there is an imp(A, B) then check that the result matches and check that A is valid
impelSecondSlot(AllLines, [[B, imp(X, Result), _]|Rest], Result, A, B) :- impelFirstSlot(AllLines, A, X).

% 1. Iterate
impelSecondSlot(AllLines, [_|Rest], Result, A, B) :- impelSecondSlot(AllLines, Rest, Result, A, B).

%---------------------------------------------------------------------------------------------------------------------------------------------