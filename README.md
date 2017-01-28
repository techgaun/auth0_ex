# Auth0Ex

[![Build Status](https://travis-ci.org/techgaun/auth0_ex.svg?branch=master)](https://travis-ci.org/techgaun/auth0_ex)

> An elixir client library for Auth0

## Installation

Currently, the package is not published to hex yet. Please use github repo as your package source:

```elixir
def deps do
  [{:auth0_ex, github: "techgaun/auth0_ex"}]
end
```

Ensure `auth0_ex` is started before your application:

```elixir
def application do
  [applications: [:auth0_ex]]
end
```

## Configuration

Add a configuration block like below:

```elixir
config :auth0_ex,
  domain: System.get_env("AUTH0_DOMAIN"),
  mgmt_token: System.get_env("AUTH0_MGMT_TOKEN"),
  http_opts: []
```

Export appropriate environment variable and you should be all set.
