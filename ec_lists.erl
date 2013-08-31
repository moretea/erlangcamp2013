-module(ec_lists).
-export([sum/1]).
-export([print_each/1]).
-export([twomult/1]).
-export([yourmap/2]).

-spec sum(list(number())) -> number().
sum(List) ->
  sum(List, 0).

-spec sum(list(number()), number()) -> number().
sum([], N) ->
  N;

sum([Head | Tail], N) ->
  sum(Tail, Head + N).


-spec print_each(list(any())) -> ok.
print_each(List) ->
  print_each(1, List).

print_each(_N, []) ->
  ok;

print_each(N, [Head|Tail]) ->
  io:format("~p : ~p\n", [N, Head]),
  print_each(N + 1, Tail).


-spec twomult(list(number())) -> list(number()).

%twomult([]) ->
%  [];
%
%twomult([Head|Tail]) ->
%  [Head *2 | twomult(Tail)].

twomult(List) ->
  Double = fun(X) -> X*2 end,
  lists:map(Double, List).

%-spec yourmap(fun(any()) -> any(), list()) -> List().

yourmap(_F, []) ->
  [];

yourmap(F, [Head|Tail]) ->
  [F(Head) | yourmap(F, Tail)].
