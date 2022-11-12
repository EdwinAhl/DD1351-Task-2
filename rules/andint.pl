% CHECK ANDINT ------------------------------------------------------------------------------------- 

% Callee
valid_andint(AllLines, and(A,B), FirstLine, SecondLine) :- andint(AllLines, A, FirstLine), andint(AllLines, B, SecondLine).

% Base case
andint([[LineNumber, X, _]|_], X, LineNumber).  % X is either A or B 

% Iterate
andint([AllLines|Rest], X, LineNumber) :- andint(Rest, X, LineNumber).

%---------------------------------------------------------------------------------------------------