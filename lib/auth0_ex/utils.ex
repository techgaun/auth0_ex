defmodule Auth0Ex.Utils do
  @moduledoc """
  Collection module of various utils needed for Auth0Ex
  """
  alias Auth0Ex.Authentication.Token
  alias Auth0Ex.Config
  alias Auth0Ex.TokenState

  def base_url do
    "https://#{Config.domain()}/"
  end

  def base_url(:mgmt), do: "#{base_url()}api/v2/"
  def base_url(_), do: base_url()
  def oauth_url, do: "#{base_url()}oauth/token"

  def mgmt_token do
    case Config.mgmt_token() do
      token when is_binary(token) ->
        token

      _ ->
        get_token_from_client()
    end
  end

  def http_opts, do: Config.http_opts()
  def ua, do: Config.user_agent()

  def req_header, do: [{"user-agent", ua()}, {"content-type", "application/json"}]
  def req_header(:mgmt), do: [{"authorization", "Bearer #{mgmt_token()}"}] ++ req_header()
  def req_header(_), do: req_header()

  defp get_token_from_client do
    case TokenState.get(:mgmt_token) do
      token when is_binary(token) ->
        exp = TokenState.get(:exp)

        if expired?(exp) do
          fetch_mgmt_token()
        else
          token
        end

      _ ->
        fetch_mgmt_token()
    end
  end

  defp fetch_mgmt_token do
    client_id = Config.mgmt_client_id()
    client_secret = Config.mgmt_client_secret()

    {:ok, %{"access_token" => token}} =
      Token.client_credentials(client_id, client_secret, base_url(:mgmt))

    TokenState.put(:mgmt_token, token)
    TokenState.put(:exp, exp_from_token(token))
    token
  end

  defp exp_from_token(token) do
    token
    |> String.split(".")
    |> Enum.at(1)
    |> Base.url_decode64!(padding: false)
    |> Jason.decode!()
    |> Map.get("exp")
  end

  defp expired?(exp), do: exp <= DateTime.utc_now() |> DateTime.to_unix()
end
