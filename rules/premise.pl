% CHECK PREMISE ------------------------------------------------------------------------------------- 

% base case
valid_premise([Premise|OtherPremises], Premise).

% iterator
valid_premise([_|OtherPremises], Premise) :- valid_premise(OtherPremises, Premise).

%----------------------------------------------------------------------------------------------------