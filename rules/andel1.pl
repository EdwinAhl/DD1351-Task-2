% CHECK ANDEL1 ------------------------------------------------------------------------------------- 

% Base case
valid_andel1([[LineNumber, and(Result, _), _]|_], Result, LineNumber).

% Iterator / Callee
valid_andel1([AllLines|Rest], Result, LineNumber) :- valid_andel1(Rest, Result, LineNumber).

%---------------------------------------------------------------------------------------------------