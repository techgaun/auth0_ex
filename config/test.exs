import Config

config :auth0_ex,
  domain: "brighterlink.auth0.com",
  mgmt_token: "TESTTOKEN",
  http_opts: []

config :exvcr,
  vcr_cassette_library_dir: "fixture/vcr_cassettes",
  custom_cassette_library_dir: "fixture/custom_cassettes",
  filter_request_headers: ["Authorization"]
