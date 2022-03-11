import Config

config :auth0_ex,
  domain: System.get_env("AUTH0_DOMAIN"),
  mgmt_token: System.get_env("AUTH0_MGMT_TOKEN"),
  mgmt_client_id: System.get_env("AUTH0_MGMT_CLIENT_ID"),
  mgmt_client_secret: System.get_env("AUTH0_MGMT_CLIENT_SECRET"),
  http_opts: []
