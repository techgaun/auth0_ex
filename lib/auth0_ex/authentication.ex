defmodule Auth0Ex.Authentication do
  @moduledoc """
  A module with various functions related to authentication api for Auth0.

  Unlike the management API code, most of the authentication code
  sit in this module as it makes sense for management API given the
  resourceful nature of each object but as useful for Authentication APIs.
  """
  use Auth0Ex.Api

  @doc """
  Given a user's credentials, and a connection, this endpoint will create
  a new user using active authentication. This endpoint only works for database connections.

      iex> Auth0Ex.Authentication.signup("client_id", "samar@example.com", "password", "some-connection")
  """
  def signup(client_id, email, password, connection) do
    payload = %{
      client_id: client_id,
      email: email,
      password: password,
      connection: connection
    }

    do_post("dbconnections/signup", payload)
  end

  @doc """
  Given the Auth0 access token obtained during login, this endpoint returns a user's profile.
  This endpoint will work only if `openid` was granted as a scope for the `access_token`.

      iex> Auth0Ex.Authentication.userinfo("sample.access_token.here")
  """
  def userinfo(access_token) do
    do_get("userinfo", %{access_token: access_token})
  end

  @doc """
  This endpoint validates a JSON Web Token (signature and expiration) and returns the
  user information associated with the user id sub property of the token.

      iex> Auth0Ex.Authentication.tokeninfo("sample.id_token.here")
  """
  def tokeninfo(id_token) do
    do_post("tokeninfo", %{id_token: id_token})
  end
end
