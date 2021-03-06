%%%-------------------------------------------------------------------
%%% @copyright (C) 2010-2015, 2600Hz
%%% @doc
%%%
%%% @end
%%% @contributors
%%%   SIPLABS, LLC (Maksim Krzhemenevskiy)
%%%-------------------------------------------------------------------
-module(kzd_agent_test).

-include_lib("eunit/include/eunit.hrl").

-define(QUEUE_ID, <<"1">>).

-define(AGENT_1, wh_json:from_list([{<<"queues">>, []}])).
-define(AGENT_2, wh_json:from_list([{<<"queues">>, [?QUEUE_ID]}])).

add_queue_test() ->
    ?assertEqual(?AGENT_2, kzd_agent:maybe_add_queue(?AGENT_1, ?QUEUE_ID, 'skip')),
    ?assertEqual('skip', kzd_agent:maybe_add_queue(?AGENT_2, ?QUEUE_ID, 'skip')),
    ?assertEqual(?AGENT_2, kzd_agent:maybe_add_queue(?AGENT_1, ?QUEUE_ID)),
    ?assertEqual(?AGENT_2, kzd_agent:maybe_add_queue(?AGENT_2, ?QUEUE_ID)).

remove_queue_test() ->
    ?assertEqual(?AGENT_1, kzd_agent:maybe_rm_queue(?AGENT_2, ?QUEUE_ID, 'skip')),
    ?assertEqual('skip', kzd_agent:maybe_rm_queue(?AGENT_1, ?QUEUE_ID, 'skip')),
    ?assertEqual(?AGENT_1, kzd_agent:maybe_rm_queue(?AGENT_2, ?QUEUE_ID)),
    ?assertEqual(?AGENT_1, kzd_agent:maybe_rm_queue(?AGENT_1, ?QUEUE_ID)).
