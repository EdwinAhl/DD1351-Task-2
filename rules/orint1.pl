% CHECK ORINT1 -------------------------------------------------------------------------------------

% Base case
valid_orint1([[LineNumber, or(Result, _), _]|_], Result, LineNumber).

% Iterator / Callee
valid_orint1([AllLines|Rest], Result, LineNumber) :- valid_orint1(Rest, Result, LineNumber).

%---------------------------------------------------------------------------------------------------