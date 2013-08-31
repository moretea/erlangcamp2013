-module(ec_recur).
-export([sum_seq/1]).

-spec sum_seq(number()) -> number().

sum_seq(N) ->
    sum_seq(N, 0).

sum_seq(0, Sum) ->
  Sum;
sum_seq(N, Sum) 
  when N > 0 ->
    sum_seq(N-1, Sum + N).
