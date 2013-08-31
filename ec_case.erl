-module(ec_case).
-export([is_a_list/1]).

-spec is_a_list(any()) -> boolean().

is_a_list(Thing) ->
  case Thing of
    [] -> 
      true;
    [_Head | _Tail] -> 
      true;
     _Else  -> 
      false
  end.

