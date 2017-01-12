defmodule Auth0Ex.Utils do
  @moduledoc """
  Collection module of various utils needed for Auth0Ex
  """

  def base_url, do: "https://#{domain}.auth0.com/api/v2/"
  def domain, do: Application.get_env(:auth0_ex, :domain)
  def mgmt_token, do: Application.get_env(:auth0_ex, :mgmt_token)
  def http_opts, do: Application.get_env(:auth0_ex, :http_opts) || []
  def ua, do: Application.get_env(:auth0_ex, :user_agent) || "Auth0Ex <https://github.com/techgaun/auth0_ex>"
  def req_header, do: [{"User-Agent", ua}, {"Authorization", "Bearer #{mgmt_token}"}]
end
