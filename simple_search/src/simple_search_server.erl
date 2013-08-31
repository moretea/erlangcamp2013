-module(simple_search_server).
-behaviour(gen_server).

-define(SERVER, ?MODULE).

%% API
-export([start_link/0, add/2,search/1]).

%% Gen server stuff
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% API
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
start_link() ->
  gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

add(Key, Document) ->
  add(Key, Document, node()).

add(Key, Document, Node) ->
  gen_server:cast({?SERVER, Node}, {add_document, {Key, Document}}).

search(Term) ->
  gen_server:call(?SERVER, {search, Term}).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Gen server callback stuff
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

init([]) ->
  {ok, reverse_index:new()}.

handle_call({search, Term}, _From, State) ->
  {reply, reverse_index:match(State, Term), State}.

handle_cast({add_document, {Key, Document}}, State) ->
  {noreply, reverse_index:add(State, Key, Document)}.


%% OTP boilerplace stuff that is not relevant for this server.
terminate(_Reason, _State) ->
  ok.

code_change(_OldVersion, State, _Extra) ->
  {ok, State}.

handle_info(_Info, State) ->
  {noreply, State}.
