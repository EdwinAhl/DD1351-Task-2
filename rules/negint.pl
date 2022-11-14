% Very nifty function to check if negint is valid with membership
% Can technically "break" as you dont check that the cont is on the last line
valid_negint(TraversedLines, Result, From, To) :- 
	
	% Finds a Subsection which matches the following rules:
	member(AssumptionSubsection, TraversedLines), 

	% The subsection must contain an assumption with the correct Line number and Result 
	member([From, Result, assumption], AssumptionSubsection), 

	% The subsection must contain a cont at the specified line
	member([To, cont, _], AssumptionSubsection).