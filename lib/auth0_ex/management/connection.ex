defmodule Auth0Ex.Management.Connection do
  @moduledoc """
  A module representing connection resource
  """
  use Auth0Ex.Api, for: :mgmt
  @path "connections"

  @doc """
  Gets all the connections

      iex> Auth0Ex.Management.Connection.all()
      iex> Auth0Ex.Management.Connection.all(%{name: "some_name"})
  """
  def all(params \\ %{}) when is_map(params) or is_list(params) do
    do_get(@path, params)
  end

  @doc """
  Get a connection

      iex> Auth0Ex.Management.Connection.get("some_conn_id")
      iex> Auth0Ex.Management.Connection.get("some_conn_id", [fields: "id,name"])
  """
  def get(id) when is_binary(id), do: get(id, [])
  def get(id, params) when is_binary(id) and (is_map(params) or is_list(params)) do
    do_get("#{@path}/#{id}", params)
  end

  @doc """
  Creates a new connection

      iex> Auth0Ex.Management.Connection.create(%{name: "some_name", strategy: "email"})
  """
  def create(body) do
    do_post("#{@path}", body)
  end

  @doc """
  Update a connection

      iex> Auth0Ex.Management.Connection.update("some_conn_id", %{name: "new name"})
  """
  def update(id, body) do
    do_patch("#{@path}/#{id}", body)
  end

  @doc """
  Delete a connection

      iex> Auth0Ex.Management.Connection.delete("some_conn_id")
  """
  def delete(id) do
    do_delete("#{@path}/#{id}")
  end

  @doc """
  Delete a specified connection user by its email

      iex> Auth0Ex.Management.Connection.delete_conn_user("some_conn_id", "samar@example.com")
  """
  def delete_conn_user(id, email) do
    do_delete("#{@path}/#{id}/users", %{email: email})
  end
end
