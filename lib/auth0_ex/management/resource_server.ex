defmodule Auth0Ex.Management.ResourceServer do
  @moduledoc """
  A module representing resource servers resource on Auth0
  """
  use Auth0Ex.Api, for: :mgmt
  @path "resource-servers"

  @doc """
  Gets all the resource servers

      iex> Auth0Ex.Management.ResourceServer.all
  """
  def all, do: do_get(@path, %{})

  @doc """
  Gets a resource server by ID

      iex> Auth0Ex.Management.ResourceServer.get("resserver")
  """
  def get(id) do
    do_get("#{@path}/#{id}", %{})
  end

  @doc """
  Creates a resource server

      iex> Auth0Ex.Management.ResourceServer.create(%{name: "resserver"})
  """
  def create(body) do
    do_post(@path, body)
  end

  @doc """
  Updates a resource server
  """
  def update(id, body) do
    do_patch("#{@path}/#{id}", body)
  end

  @doc """
  Deletes a resource server

      iex> Auth0Ex.Management.ResourceServer.delete("resserver")
  """
  def delete(id) do
    do_delete("#{@path}/#{id}")
  end
end
