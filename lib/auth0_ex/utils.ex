defmodule Auth0Ex.Utils do
  @moduledoc """
  Collection module of various utils needed for Auth0Ex
  """
  def base_url, do: "https://#{domain()}.auth0.com/api/v2/"
  def domain, do: get_config(:domain)

  def mgmt_token do
    case get_config(:mgmt_token) do
      token when is_binary(token) -> token

      _ ->
        cient_id = get_config(:mgmt_client_id)
        client_secret = get_config(:mgmt_client_secret)
    end
  end

  def http_opts, do: get_config(:http_opts) || []
  def ua, do: get_config(:user_agent) || "Auth0Ex <https://github.com/techgaun/auth0_ex>"
  def req_header, do: [{"User-Agent", ua()},
                       {"Authorization", "Bearer #{mgmt_token()}"},
                       {"Content-Type", "application/json"}]

  defp get_config(key), do: Application.get_env(:auth0_ex, key)
end
