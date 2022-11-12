% CHECK COPY ------------------------------------------------------------------------------------- 

% Base case
valid_copy([[LineNumber, Result, _]|_], Result, LineNumber).

% Iterator
valid_copy([AllLines|Rest], Result, LineNumber) :- valid_copy(Rest, Result, LineNumber).

%------------------------------------------------------------------------------------------------ 