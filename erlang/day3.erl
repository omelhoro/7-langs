c(day3m).
f(S).
S=spawn(fun day3m:server/0).
S ! new.
trant ! {t,S,"house"}.
% trant ! 1.
