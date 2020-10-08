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

  API Management https://auth0.com/docs/api/authentication#signup

  client_id: is part of your configuration and you should get via `Application.get_env/2`
  connection: is an auth0 concept; They list the following connections `database, social, enterprise, or passwordless connection`.

  A use case should be, we want to use the database connection to create new signup, the value for that connection is in the dashboard inside of `Connections -> Database` or at the URL `https://manage.auth0.com/dashboard/us/<tenant>/connections/database`.

  NOTE: The default name for the database connection is `Username-Password-Authentication`. You can create a new database connection instead.

      iex> client_id = Application.get_env(:auth0_ex, :mgmt_client_id)
      iex> connection = "Username-Password-Authentication"
      iex> Auth0Ex.Authentication.signup(client_id, "samar@example.com", "password", connection, %{user_metadata: %{plan: "silver", team_id: "a111"}})
  """
  def signup(client_id, email, password, connection, extra_params \\ %{}) do
    payload = %{
      client_id: client_id,
      email: email,
      password: password,
      connection: connection
    }

    do_post("dbconnections/signup", Map.merge(payload, extra_params))
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
