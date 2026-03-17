-module(nova_page_router).
-behaviour(nova_router).

-export([routes/1]).

routes(_Environment) ->
    [#{prefix => "",
       security => false,
       routes => [
                  {"/releases", fun nova_page_releases_controller:releases/1, #{methods => [get]}}
                 ],
       statics => [
                   {"/", "assets/index.html"},
                   {"/assets/[...]", "assets"}
                  ]
      }].
