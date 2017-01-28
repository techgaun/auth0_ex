defmodule Auth0Ex.Management.User do
  @moduledoc """
  A module representing users on Auth0
  """

  use Auth0Ex.Api
  @path "users"

  @doc """
  Gets all the users

      iex> Auth0Ex.Management.User.all()
      iex> Auth0Ex.Management.User.all(fields: "name", q: "app_metadata.admin:'true'")
  """
  def all(params \\ %{}) when is_map(params) or is_list(params) do
    do_get(@path, params)
  end

  @doc """
  Gets a specific user record with a given user id

      iex> Auth0Ex.Management.User.get("auth0|some_user_id")
      iex> Auth0Ex.Management.User.get("auth0|some_user_id", %{fields: "email,name,username"})
  """
  def get(user_id, params \\ %{}) when is_binary(user_id) and is_map(params) do
    do_get("#{@path}/#{user_id}", params)
  end

  @doc """
  Creates a user for the specified connection

      iex> Auth0Ex.Management.User.create("test_connection", %{email: "test.user@email.com", username: "test_user_name"})
  """
  def create(connection, body \\ %{}) when is_binary(connection) and is_map(body) do
    do_post(@path, Map.put(body, :connection, connection))
  end

  @doc """
  Updates a user's information given a user id

      iex> Auth0Ex.Management.User.update("auth0|some_user_id", %{app_metadata: %{admin: false}})
  """
  def update(user_id, body \\ %{}) when is_binary(user_id) and is_map(body) do
    do_patch("#{@path}/#{user_id}", body)
  end

  @doc """
  Deletes a user with a give user id

      iex> Auth0Ex.Management.User.delete("auth0|some_user_id")
  """
  def delete(user_id) when is_binary(user_id) do
    do_delete("#{@path}/#{user_id}")
  end

  @doc """
  Get a user's log

      iex> Auth0Ex.Management.User.log("auth0|233423")
      iex> Auth0Ex.Management.User.log("auth0|23423", page: 2, per_page: 10)
  """
  def log(user_id, params) do
    do_get("#{@path}/#{user_id}/logs", params)
  end

  @doc """
  Get all Guardain enrollments for given user_id

      iex> Auth0Ex.Management.User.enrollments("auth0|234")
  """
  def enrollments(user_id), do: do_get("#{@path}/#{user_id}/enrollments", %{})

  @doc """
  Deletes a user's multifactor provider

      iex> Auth0Ex.Management.User.delete_mfprovider("auth0|23423", "duo")
  """
  def delete_mfprovider(user_id, provider) do
    do_delete("#{@path}/#{user_id}/multifactor/#{provider}")
  end

  @doc """
  Unlinks an identity from the target user, and it becomes a separated user again.

      iex> Auth0Ex.Management.User.unlink("some_user_id", "github", "23984234")
  """
  def unlink(primary_id, provider, secondary_id) do
    do_delete("#{@path}/#{primary_id}/identities/#{provider}/#{secondary_id}")
  end

  @doc """
  Removes current Guardain recovery code and generates new one

      iex> Auth0Ex.Management.User.regenerate_recovery_code("auth0|34234")
  """
  def regenerate_recovery_code(id) do
    do_post("#{@path}/#{id}/recovery-code-regeneration")
  end

  @doc """
  Links the account specified in the body to the given user_id param

      iex> Auth0Ex.Management.User.link("some_user_id", link_with: "secondary_acc_jwt")
      iex> Auth0Ex.Management.User.link("some_user_id", provider: "github", user_id: "23423", connection_id: "som")
  """
  def link(id, body) do
    do_post("#{@path}/#{id}/identities", body)
  end
end
