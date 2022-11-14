% CHECK OREL ------------------------------------------------------------------------------------- 

valid_orel(TraversedLines, Result, X, Y, U, V, W) :- 

    % Check or
    member([X, or(A, B), _], TraversedLines),


    % Finds subsection 1 
	member(AssumptionSubsection1, TraversedLines), 

    % Check A in section 1 as assumption
    member([Y, A, assumption], AssumptionSubsection1),

    % Check result in section 1
    member([U, Result, _], AssumptionSubsection1),


    % Finds subsection 2 
	member(AssumptionSubsection2, TraversedLines), 

    % Check B in section 2 as assumption
    member([V, B, assumption], AssumptionSubsection2),

    % Check result in section 2
    member([W, Result, _], AssumptionSubsection2),

%-------------------------------------------------------------------------------------------------