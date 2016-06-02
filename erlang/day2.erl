-module(day2).
-export([get_key/2,check_tt/1,transp/1,diagn/2]).
%1
get_key(_,[]) -> false;
get_key(K,[{K,V}|_]) -> V;
get_key(K,[_|T]) -> get_key(K,T).
%2
transp([[]|_]) -> [];
transp(L) -> [
              lists:map(fun([H|_]) -> H end, L) |
              transp(lists:map(fun([_|T]) -> T end,L))]. 
diagn(L,Lseq) ->
      lists:map(
        fun({Li,I}) -> lists:nth(I,Li) end,
        lists:zip(L,Lseq)).
check_tt(B) -> 
    Blen=length(B),
    checkall(lists:merge([
                 B,
                 transp(B),
                 [diagn(B,lists:seq(1,Blen))],
                 [diagn(B,lists:seq(Blen,1,-1))]
                ])).
checkall([]) ->
    cat;
checkall([H|T]) ->
    [Hitm|_]=H,
    case lists:all(fun(Itm) -> Itm==Hitm end,H) of  
        true ->io:fwrite("~w wins~n",[Hitm]);
        false -> checkall(T)
    end.
    
