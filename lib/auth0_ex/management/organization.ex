defmodule Auth0Ex.Management.Organization do
  @moduledoc """
  A module representing organizations on Auth0
  """
  use Auth0Ex.Api, for: :mgmt
  @path "organizations"

  @doc """
  Gets organizations

      iex> Auth0Ex.Management.Organization.all()
      iex> Auth0Ex.Management.Organization.all(page: 0, per_page: 10)
  """
  def all(params \\ %{}) when is_map(params) or is_list(params) do
    do_get(@path, params)
  end

  @doc """
  Gets an organization

      iex> Auth0Ex.Management.Organization.get("some_organization_id")
  """
  def get(id) when is_binary(id) do
    do_get("#{@path}/#{id}", %{})
  end

  @doc """
  Creates an organization

      iex> Auth0Ex.Management.Organization.create(%{name: "example", display_name: "Example"})
  """
  def create(body), do: do_post(@path, body)

  @doc """
  Updates an organization

      iex> Auth0Ex.Management.Organization.update("some_organization_id", display_name: "New Name")
  """
  def update(id, body) do
    do_patch("#{@path}/#{id}", body)
  end

  @doc """
  Deletes an organization

      iex> Auth0Ex.Management.Organization.delete("some_organization_id")
  """
  def delete(id), do: do_delete("#{@path}/#{id}")

  @doc """
  Gets members who belong to an organization

      iex> Auth0Ex.Management.Organization.members("some_organization_id")
  """
  def members(organization_id) when is_binary(organization_id) do
    do_get("#{@path}/#{organization_id}/members", %{})
  end

  @doc """
  Gets the roles assigned to an organization member

      iex> Auth0Ex.Management.Organization.member_roles("some_organization_id", "some_user_id")
  """
  def member_roles(organization_id, user_id)
      when is_binary(organization_id) and is_binary(user_id) do
    do_get("#{@path}/#{organization_id}/members/#{user_id}/roles", %{})
  end
end
