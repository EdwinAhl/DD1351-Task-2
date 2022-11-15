valid_mt(TraversedLines, Result, FirstLine, SecondLine) :- 
	% First line has an implication
	member([FirstLine, imp(Result, Implication), _], TraversedLines),

	% Second line has the negation of the implication
	member([SecondLine, neg(Implication), _], TraversedLines).