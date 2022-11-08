% CHECK COPY ------------------------------------------------------------------------------------- 

valid_copy([[LineNumber, Result, _]|_], Result, LineNumber).
valid_copy([AllLines|Rest], Result, LineNumber) :- valid_copy(Rest, Result, LineNumber).

%------------------------------------------------------------------------------------------------ 