% CHECK NEGEL -----------------------------------------------------------------------------------------------------------

valid_negel(TraversedLines, FirstLine, SecondLine) :-
	member([FirstLine, Result, _], TraversedLines),
	member([SecondLine, neg(Result), _], TraversedLines).

% -------------------------------------------------------------------------------------------------------------------------