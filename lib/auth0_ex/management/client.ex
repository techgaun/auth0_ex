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

  @doc """
  Creates a new Auth0 client from given body

      iex> Auth0Ex.Management.Client.create(%{name: "Samars App"})
  """
  def create(body) do
    do_post("#{@path}", body)
  end

  @doc """
  Updates Auth0 client of given ID with given body
  """
  def update(id, body) do
    do_patch("#{@path}/#{id}", body)
  end

  @doc """
  Deletes the client with given client id

      iex> Auth0Ex.Management.Client.delete("some_client_id")
  """
  def delete(id) do
    do_delete("#{@path}/#{id}")
  end

  @doc """
  Rotate a client secret for client with given ID
  """
  def rotate_secret(id) do
    do_post("#{@path}/#{id}/rotate-secret")
  end
end
