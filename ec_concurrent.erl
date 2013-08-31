-module(ec_concurrent).
-export([bf_seq/1]).

bf_seq(List) ->
  spawn(fun() -> bf_seq_forward(List) end),
  spawn(fun() -> bf_seq_backward(List) end).

bf_seq_forward([]) ->
  ok;
bf_seq_forward([Head|Tail]) ->
  io:format("f~p\n", [Head]),
  bf_seq_forward(Tail).

bf_seq_backward([]) ->
  ok;
bf_seq_backward([Head|Tail]) ->
  bf_seq_backward(Tail),
  io:format("b~p\n", [Head]).
