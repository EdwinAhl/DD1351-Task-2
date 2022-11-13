% CHECK NEGNEGEL -----------------------------------------------------------------------------------------------------------

% Base case
valid_negnegel([[LineNumber, neg(neg(Result)), _]|_], Result, LineNumber).

% Iterator / Callee
valid_negnegel([AllLines|Rest], Result, LineNumber) :- valid_negnegel(Rest, Result, LineNumber).

%---------------------------------------------------------------------------------------------------