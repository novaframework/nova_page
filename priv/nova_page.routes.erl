#{prefix => "",
  security => false,
  routes => [{"/releases", {nova_page_releases_controller, releases}, #{methods => [get]}}],
 statics => [{"/", "assets/index.html"},
             {"/assets/[...]", "assets"}
            ]
}.
