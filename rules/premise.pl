% CHECK PREMISE ------------------------------------------------------------------------------------- 

valid_premise([Premise|OtherPremises], Premise).
valid_premise([_|OtherPremises], Premise) :- valid_premise(OtherPremises, Premise).

%----------------------------------------------------------------------------------------------------