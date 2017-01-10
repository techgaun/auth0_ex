defmodule Auth0Ex.Management.Client do
  @moduledoc """
  A module representing client on Auth0
  """

  use Auth0Ex.Api
  @path "clients"

  @doc """
  Gets all the clients
  """
  def get(params \\ %{}) when is_map(params) or is_list(params) do
    do_get(@path, params)
  end
end
