% CHECK ORINT2 -------------------------------------------------------------------------------------

% Base case
valid_orint2([[LineNumber, or(_, Result), _]|_], Result, LineNumber).

% Iterator / Callee
valid_orint2([AllLines|Rest], Result, LineNumber) :- valid_orint2(Rest, Result, LineNumber).

%---------------------------------------------------------------------------------------------------