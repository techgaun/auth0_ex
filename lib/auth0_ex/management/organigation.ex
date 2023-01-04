defmodule Auth0Ex.Management.Organization do
  @moduledoc """
  A module representing organizations on Auth0
  """
  use Auth0Ex.Api, for: :mgmt
  @path "organizations"

  @doc """
  Get all organizations

      iex> Auth0Ex.Management.Organization.all()
  """
  def all(params \\ %{}) when is_map(params) or is_list(params) do
    do_get(@path, params)
  end

  @doc """
  Get a organization

      iex> Auth0Ex.Management.Organization.get("some_organization_id")
  """
  def get(id) when is_binary(id) do
    do_get("#{@path}/#{id}", %{})
  end

  @doc """
  Create a organization

      iex> Auth0Ex.Management.Organization.create(%{name: "some_organization_id", script: "some_script_code"})
  """
  def create(body), do: do_post(@path, body)

  @doc """
  Update a organization

      iex> Auth0Ex.Management.Organization.update("some_organization_id", name: "new_name")
  """
  def update(id, body) do
    do_patch("#{@path}/#{id}", body)
  end

  @doc """
  Deletes a organization

      iex> Auth0Ex.Management.Organization.delete("some_organization_id")
  """
  def delete(id), do: do_delete("#{@path}/#{id}")

  @doc """
  Get members who belong to an organization

      iex> Auth0Ex.Management.Organization.members("some_organization_id")
      {:ok,
        [
          %{
            "email" => "some@email.com",
            "name" => "JG",
            "picture" => "https://lh3.googleusercontent.com/a/XXXXXX",
            "user_id" => "google-oauth2|11111111111111111"
          },
          %{
            "email" => "some2@example.com",
            "name" => "Momenti ",
            "picture" => "https://lh3.googleusercontent.com/a/xxxxxxxxxxxxxxxxx",
            "user_id" => "google-oauth2|222222222222222222"
          }]}
  """
  def members(organization_id) when is_binary(organization_id) do
    do_get("#{@path}/#{organization_id}/members", %{})
  end

  @doc """
  Get the roles assigned to an organization member

      iex> Auth0Ex.Management.Organization.roles("some_organization_id", "some_user_id")
      {:ok,
        [
          %{
            "description" => "test_role",
            "id" => "rol_UUCsDI97rW7be85p",
            "name" => "test_role"
          }
        ]}
  """
  def member_roles(organization_id, user_id)
      when is_binary(organization_id) and is_binary(user_id) do
    do_get("#{@path}/#{organization_id}/members/#{user_id}/roles", %{})
  end
end
