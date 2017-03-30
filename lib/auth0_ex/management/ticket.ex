defmodule Auth0Ex.Management.Ticket do
  @moduledoc """
  A module representing tickets on Auth0
  """

  use Auth0Ex.Api, for: :mgmt
  @path "tickets"

  @doc """
  Create an email verification ticket

      iex> Auth0Ex.Management.Ticket.email_verification("auth0|user_id", %{result_url: "http://myapp.com/callback", ttl_sec: 0})
  """
  def email_verification(user_id, body) do
    do_post("#{@path}/email-verification", Map.put(body, :user_id, user_id))
  end

  @doc """
  Create a password change ticket

      iex> Auth0Ex.Management.Ticket.password_change(%{result_url: "http://myapp.com/callback"})
  """
  def password_change(body) do
    do_post("#{@path}/password-change", body)
  end
end
