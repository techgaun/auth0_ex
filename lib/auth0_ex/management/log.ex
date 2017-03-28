defmodule Auth0Ex.Management.Log do
  @moduledoc """
  A module represeting log resource on Auth0
  """
  use Auth0Ex.Api, for: :mgmt
  @path "logs"

  @doc """
  Retrieve the log entries that match the specified criteria

      iex> Auth0Ex.Management.Log.search(page: 1, fields: "user_name")
  """
  def search(params) when is_list(params) or is_map(params) do
    do_get(@path, params)
  end

  @doc """
  Get a log event by id
  """
  def get(id) do
    do_get("#{@path}/#{id}", %{})
  end
end
