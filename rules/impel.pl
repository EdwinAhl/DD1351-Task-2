% CHECK IMPEL --------------------------------------------------------------------------------------------------------------------------------

% [1, imp(p,x),    premise],
% [2, p,           premise],
% [3, x,           impel(2,1)],
valid_impel(TraversedLines, Result, FirstLine, SecondLine) :-
	% Saves the first line result for the later check
	member([FirstLine, FirstResult, _], TraversedLines),

	% makes sure the implication goes from FirstLine to Result
	member([SecondLine, imp(FirstResult, Result), _], TraversedLines).

%---------------------------------------------------------------------------------------------------------------------------------------------