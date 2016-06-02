-module(day3m).
-export([server/0]).
tran() ->
    receive 
        1 -> io:format("Dying~n"),exit({day3m,die,at,erlang:time()});
        {t,To,T} -> 
            To ! {self(),T},tran();
        {r,T} -> 
            io:fwrite("~p~n",[T]),
            tran()
    end.
dict() -> [{"house","case"},{"hard","duro"}].

get_word(_,[]) -> unknown;
get_word(W,[{W,T}|_]) -> T;
get_word(W,[_|T]) -> get_word(W,T).

server() ->
    process_flag(trap_exit,true),
   receive 
       new -> 
           io:format("Creating new instance"),
           register(trant,spawn_link(fun tran/0)),
           server();
       {From,W} -> 
           T=get_word(W,dict()),
           From ! {r,T},
                        server();
       {'EXIT',_,_} ->
           io:format("Died"),
           self() ! new,
           server()
end. 
