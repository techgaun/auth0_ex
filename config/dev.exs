use Mix.Config

config :auth0_ex,
  domain: System.get_env("AUTH0_DOMAIN")
