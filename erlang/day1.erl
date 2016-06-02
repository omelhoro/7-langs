-module(day1).
-export([nwords/1]).
-export([toten/0]).
-export([fail_succ/1]).
% 1
nwords(W) -> nwords(W,0).
nwords([],C) -> C;
nwords([32|Ta],C) -> nwords(Ta,C+1);
nwords([_|Ta],C) -> nwords(Ta,C).
%2
toten() -> countup(10).
countup(N) -> count(0,N).
count(N,N) -> io:write(N);
count(F,S) -> io:write(F), count(F+1,S).
%3
fail_succ({error,Message}) -> io:fwrite("error:~s~n",[Message]);
fail_succ(success) -> io:fwrite("success~n").
