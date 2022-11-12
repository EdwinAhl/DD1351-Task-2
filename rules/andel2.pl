% CHECK ANDEL2 ------------------------------------------------------------------------------------- 

% Base case
valid_andel2([[LineNumber, and(_, Result), _]|_], Result, LineNumber).

% Iterator / Callee
valid_andel2([AllLines|Rest], Result, LineNumber) :- valid_andel2(Rest, Result, LineNumber).

%---------------------------------------------------------------------------------------------------