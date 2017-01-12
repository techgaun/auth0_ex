use Mix.Config

config :auth0_ex,
  domain: System.get_env("AUTH0_DOMAIN"),
  mgmt_token: System.get_env("AUTH0_MGMT_TOKEN"),
  http_opts: []
