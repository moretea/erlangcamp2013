-module(simple_search_superviser).
-behaviour(supervisor).

%% API
-export([start_link/0]).
 
%% Supervisor calls
-export([init/1]).

%% Child definition helper
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).


% API
start_link() ->
  % start a new supervisor and make it run this module as the new supervisor.
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
  {ok, { {one_for_one, 5, 10}, [?CHILD(simple_search_server, worker)]} }.
