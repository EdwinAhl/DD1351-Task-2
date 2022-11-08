% CHECK NEGEL -----------------------------------------------------------------------------------------------------------

% matcher
negelSecondSlot([[SecondNum, neg(X), _]|_], SecondNum, X).

% iterator
% AllLines, Second slot number, what to negate
negelSecondSlot([_|Rest], SecondNum, X) :- negelSecondSlot(Rest, SecondNum, X).

% matcher
negelFirstSlot(AllLines, [[FirstNum, X, _]|_], FirstNum, SecondNum) :- negelSecondSlot(AllLines, SecondNum, X).

% iterator
% AllLines, AllLines, First slot number, second slot number
negelFirstSlot(AllLines, [_|Rest], FirstNum, SecondNum) :- negelFirstSlot(AllLines, Rest, FirstNum, SecondNum).

% -------------------------------------------------------------------------------------------------------------------------