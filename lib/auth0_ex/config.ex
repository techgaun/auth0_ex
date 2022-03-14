defmodule Auth0Ex.Config do
  @moduledoc """
  All of the configurations pertaining to `Auth0Ex`.
  """

  @spec domain() :: String.t()
  def domain do
    auth0_domain = Application.get_env(:auth0_ex, :domain)

    if String.ends_with?(auth0_domain, "auth0.com") or custom_domain?() do
      auth0_domain
    else
      raise ArgumentError,
            "the domain specified must be a fully qualified domain name, it should be : <your_tenant>[.optional_region].auth0.com, not just <your_tenant>"
    end
  end

  @spec mgmt_client_id() :: String.t() | nil
  def mgmt_client_id do
    Application.get_env(:auth0_ex, :mgmt_client_id)
  end

  @spec mgmt_client_secret() :: String.t() | nil
  def mgmt_client_secret do
    Application.get_env(:auth0_ex, :mgmt_client_secret)
  end

  @spec mgmt_token() :: String.t() | nil
  def mgmt_token do
    Application.get_env(:auth0_ex, :mgmt_token)
  end

  @spec http_opts() :: list()
  def http_opts do
    Application.get_env(:auth0_ex, :http_opts) || []
  end

  @spec user_agent() :: String.t()
  def user_agent do
    Application.get_env(:auth0_ex, :user_agent) ||
      "Auth0Ex <https://github.com/techgaun/auth0_ex>"
  end

  defp custom_domain? do
    Application.get_env(:auth0_ex, :custom_domain, false) in [true, "true"]
  end
end
