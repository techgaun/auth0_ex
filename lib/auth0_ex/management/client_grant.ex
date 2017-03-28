defmodule Auth0Ex.Management.ClientGrant do
  @moduledoc """
  A module representing client_grant resource
  """
  use Auth0Ex.Api, for: :mgmt
  @path "client-grants"

  @doc """
  Gets all the client grants

      iex> Auth0Ex.Management.ClientGrant.all()
      iex> Auth0Ex.Management.ClientGrant.all(audience: "aud")
  """
  def all(params \\ %{}) when is_map(params) or is_list(params) do
    do_get(@path, params)
  end

  @doc """
  Creates a client grant

      iex> Auth0Ex.Management.ClientGrant.create(%{client_id: "client_id", audience: "someaud", scope: []})
  """
  def create(body) do
    do_post(@path, body)
  end

  @doc """
  Updates a client grant

      iex> Auth0Ex.Management.ClientGrant.update("client_grant_to_update", %{scope: []})
  """
  def update(id, body) do
    do_patch("#{@path}/#{id}", body)
  end

  @doc """
  Delete a client grant

      iex> Auth0Ex.Management.ClientGrant.delete("client_grant_to_delete")
  """
  def delete(id) do
    do_delete("#{@path}/#{id}")
  end
end
