defmodule Auth0Ex.Authentication.Login do
  @moduledoc """
  A module that handles login stuff for authentication API
  """

  use Auth0Ex.Api

  @doc """
  Given the social provider's access_token and the connection, this endpoint will authenticate
  the user with the provider and return a JSON with the `access_token` and, optionally, an `id_token`.
  This endpoint only works for Facebook, Google, Twitter and Weibo.

      iex> Auth0Ex.Authentication.Login.social("client_id", "access_token", "facebook")
      iex> Auth0Ex.Authentication.Login.social("client_id", "access_token", "facebook", "openid profile email")
  """
  def social(client_id, access_token, connection, scope \\ "openid") do
    payload = %{
      client_id: client_id,
      access_token: access_token,
      connection: connection,
      scope: scope
    }

    do_post("oauth/access_token", payload)
  end

  @doc """
  Given the user credentials and the connection specified, it will do the authentication
  on the provider and return a JSON with the `access_token` and `id_token`.

  You can pass optional parameters as a map in the last `params` argument.

  An example params map would be:

      %{scope: "openid app_metadata"}
      %{device: "ios", id_token: "id_token_touchid"}


      iex> Auth0Ex.Authentication.Login.database("client_id", "samar", "samarpwd", "dev", "password")
      iex> Auth0Ex.Authentication.Login.database("client_id", "samar", "samarpwd", "dev", "password", %{scope: "openid app_metadata"})
  """
  def database(client_id, username, password, connection, grant_type, params \\ %{})
      when is_map(params) do
    payload = %{
      client_id: client_id,
      username: username,
      password: password,
      connection: connection,
      grant_type: grant_type
    }

    do_post("oauth/ro", Map.merge(payload, params))
  end
end
