-module(ec_math).
-export([op/3]).

-spec op(add|sub, number(), number()) -> number().

op(add, X, Y) -> X + Y;
op(sub, X, Y) when Y = X -> X - Y.
