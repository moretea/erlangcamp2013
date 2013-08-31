-module(reverse_index).

-export([new/0, add/3, match/2]).

new() ->
  gb_trees:empty().

add(Index, DocumentId, Term) ->
  case gb_trees:lookup(Term, Index) of 
    {value, OrigDocIds} ->
      gb_trees:update(Term, [DocumentId|OrigDocIds], Index);
    none ->
      gb_trees:insert(Term, [DocumentId], Index)
  end.

match(Index, Term) ->
  case gb_trees:lookup(Term, Index) of 
    {value, DocumentIds} ->
      DocumentIds;
    none ->
      []
  end.
