% CHECK PREMISE ------------------------------------------------------------------------------------- 

% Base case
valid_premise([Premise|OtherPremises], Premise).

% Iterator
valid_premise([_|OtherPremises], Premise) :- valid_premise(OtherPremises, Premise).

%----------------------------------------------------------------------------------------------------