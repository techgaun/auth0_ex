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

end