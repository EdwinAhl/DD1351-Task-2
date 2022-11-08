% Check validity of premise ------------------------------
valid_line(Prems, _, _, _, Premise, premise) :- valid_premise(Prems, Premise).



% CHECK PREMISE ------------------------------------------------------------------------------------- 

valid_premise([Premise|OtherPremises], Premise).
valid_premise([_|OtherPremises], Premise) :- valid_premise(OtherPremises, Premise).

%----------------------------------------------------------------------------------------------------