import Config

config :auth0_ex,
  domain: System.get_env("AUTH0_DOMAIN"),
  mgmt_token: System.get_env("AUTH0_MGMT_TOKEN"),
  http_opts: []

config :exvcr,
  vcr_cassette_library_dir: "fixture/vcr_cassettes",
  custom_cassette_library_dir: "fixture/custom_cassettes",
  filter_request_headers: ["Authorization"]
