defmodule Auth0Ex.Authentication.Token do
  @moduledoc """
  A moodule for getting tokens for authentication.
  This is the module that gives you auth codes and client credentials.

  More information at [this page](https://auth0.com/docs/api/authentication?http#get-token)
  """

  use Auth0Ex.Api
  @path "oauth/token"

  @doc """
  This is the OAuth 2.0 grant that regular web apps utilize in order to
  access an API. Use this endpoint to exchange an Authorization Code for a Token.

      iex> Auth0Ex.Authentication.Token.auth_code("client_id", "client_secret", "code")
      iex> Auth0Ex.Authentication.Token.auth_code("client_id", "client_secret", "code", "redirect_uri_here")
  """
  def auth_code(client_id, client_secret, code, redirect_uri \\ nil) do
    payload = %{
      client_id: client_id,
      client_secret: client_secret,
      code: code,
      redirect_uri: redirect_uri,
      grant_type: "authorization_code"
    }

    do_post(@path, payload)
  end

  @doc """
  This is the OAuth 2.0 grant that mobile apps utilize in order to
  access an API. Use this endpoint to exchange an Authorization Code for a Token.
      iex> Auth0Ex.Authentication.Token.auth_code_pkce("client_id", "client_secret", "code", "code_verifier")
      iex> Auth0Ex.Authentication.Token.auth_code_pkce("client_id", "client_secret", "code", "code_verifier", "redirect_uri_here")
  """
  def auth_code_pkce(client_id, client_secret, code, code_verifier, redirect_uri \\ nil) do
    payload = %{
      client_id: client_id,
      client_secret: client_secret,
      code: code,
      code_verifier: code_verifier,
      redirect_uri: redirect_uri,
      grant_type: "authorization_code"
    }

    do_post(@path, payload)
  end

  @doc """
  This is the OAuth 2.0 grant that server processes utilize in order to access an API.
  Use this endpoint to directly request an access_token by using the Client Credentials
  (a Client Id and a Client Secret).

      iex> Auth0Ex.Authentication.Token.client_credentials("client_id", "client_secret", "API_IDENTIFIER_aud")
  """
  def client_credentials(client_id, client_secret, audience) do
    payload = %{
      client_id: client_id,
      client_secret: client_secret,
      audience: audience,
      grant_type: "client_credentials"
    }

    do_post(@path, payload)
  end
end
