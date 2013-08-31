%%% @author me
%%% @doc contains add function
%%% @copyright 2013 me

-module(ec_add).
-export([add/2]).
-export([add2/2]).
-export([mult/3]).

%fun add a b ->
%  a + b

-spec(add(number(), number()) -> number()).
add(A,B) ->
  A + B.

add2(C,D) -> C+D.

mult(X,Y,Z) -> X*Y*Z.
