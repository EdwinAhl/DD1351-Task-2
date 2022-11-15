% CHECK IMPEL --------------------------------------------------------------------------------------------------------------------------------

valid_impel(TraversedLines, Result, FirstLine, SecondLine) :-
	member([FirstLine, FirstResult, _], TraversedLines).
	member([SecondLine, imp(FirstResult, Result), _], TraversedLines).

%---------------------------------------------------------------------------------------------------------------------------------------------