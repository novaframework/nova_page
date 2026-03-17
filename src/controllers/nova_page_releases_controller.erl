-module(nova_page_releases_controller).

-export([releases/1]).

-define(HEADERS, #{<<"accept">> => <<"application/vnd.github.v3+json">>,
                   <<"User-Agent">> => <<"Nova homepage">>}).

releases(_) ->
    LatestRelease = get_latest(),
    {ok, [{latest, LatestRelease}]}.

get_latest() ->
    Url = <<"https://api.github.com/repos/novaframework/nova/releases/latest">>,
    case jhn_shttpc:get(Url, opts()) of
        #{status := {200, _}, body := ReleaseBody} ->
                json:decode(ReleaseBody)
    end.

opts() ->
    #{headers => ?HEADERS,
    close => true}.
