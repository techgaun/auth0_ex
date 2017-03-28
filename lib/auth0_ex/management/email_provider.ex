defmodule Auth0Ex.Management.EmailProvider do
  @moduledoc """
  A module representing emails resource on Auth0
  """
  use Auth0Ex.Api, for: :mgmt
  @path "emails/provider"

  @doc """
  Gets the email provider

      iex> Auth0Ex.Management.EmailProvider.get()
      iex> Auth0Ex.Management.EmailProvider.get(fields: "name,enabled")
  """
  def get(params \\ %{}) when is_map(params) or is_list(params) do
    do_get(@path, params)
  end

  @doc """
  Configures the email provider

      iex> Auth0Ex.Management.EmailProvider.configure(name: "mandrill", enabled: true)
  """
  def configure(body), do: do_post(@path, body)

  @doc """
  Updates the email provider

      iex> Auth0Ex.Management.EmailProvider.update(name: "new_name")
  """
  def update(body), do: do_patch(@path, body)

  @doc """
  Deletes the email provider

      iex> Auth0Ex.Management.EmailProvider.delete()
  """
  def delete, do: do_delete(@path)
end
