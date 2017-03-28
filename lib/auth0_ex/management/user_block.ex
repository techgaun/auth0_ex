defmodule Auth0Ex.Management.UserBlock do
  @moduledoc """
  A module representing user blocks resource on Auth0
  """
  use Auth0Ex.Api, for: :mgmt
  @path "user-blocks"

  @doc """
  Gets all user blocks for given identifier.
  Identifier should be any of: username, phone_number, email

      iex> Auth0Ex.Management.UserBlock.get("some@example.com")
  """
  def get(identifier), do: do_get(@path, %{identifier: identifier})

  @doc """
  Get a user's block

      iex> Auth0Ex.Management.UserBlock.get_user_block("auth0|234234")
  """
  def get_user_block(user_id), do: do_get("#{@path}/#{user_id}", %{})

  @doc """
  Unblock a block by identifier

      iex> Auth0Ex.Management.UserBlock.unblock("some@example.com")
  """
  def unblock(identifier), do: do_delete(@path, identifier: identifier)

  @doc """
  Unblock a user

      iex> Auth0Ex.Management.UserBlock.unblock_user("auth0|2342")
  """
  def unblock_user(user_id), do: do_delete("#{@path}/#{user_id}")
end
