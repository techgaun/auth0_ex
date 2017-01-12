defmodule Auth0Ex.Management.Client do
  @moduledoc """
  A module representing client on Auth0
  """

  use Auth0Ex.Api
  @path "clients"

  @doc """
  Gets all the clients

      iex> Auth0Ex.Management.Client.all()
      iex> Auth0Ex.Management.Client.all(fields: "name,client_id")
  """
  def all(params \\ %{}) when is_map(params) or is_list(params) do
    do_get(@path, params)
  end

  @doc """
  Gets the information for individual client

      iex> Auth0Ex.Management.Client.get("some_id")
      iex> Auth0Ex.Management.Client.get("some_id", [fields: "id,client_id", include_fields: true])
  """
  def get(id) when is_binary(id), do: get(id, [])
  def get(id, params) when is_binary(id) and (is_map(params) or is_list(params)) do
    do_get("#{@path}/#{id}", params)
  end
end
