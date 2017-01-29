defmodule Auth0Ex.Management.Blacklist do
  @moduledoc """
  A module representing blacklisted tokens on Auth0
  """
  use Auth0Ex.Api
  @path "blacklists/tokens"

  @doc """
  Retrieves the `jti` and `aud` of all tokens in the blacklist.

      iex> Auth0Ex.Management.Blacklist.get("some_aud")
  """
  def get(aud) do
    do_get(@path, aud: aud)
  end

  @doc """
  Adds the token identified by the `jti` to a blacklist for the tenant.

      iex> Auth0Ex.Management.Blacklist.blacklist(aud: "some_aud", jti: "some_jti")
  """
  def blacklist(body) do
    do_post(@path, body)
  end
end
