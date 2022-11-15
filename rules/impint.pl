valid_impint(TraversedLines, Assumption, Result, From, To) :- 
	% Finds a Subsection which matches the following rules:
	member(AssumptionSubsection, TraversedLines), 

	% Checks that the assumption is correct
	member([From, Assumption, assumption], AssumptionSubsection),

	% Checks that the result, last line is correct
	last(AssumptionSubsection, [To, Result, _]).
