defmodule Auth0Ex.Management.Ticket do
  @moduledoc """
  A module representing tickets on Auth0
  """

  use Auth0Ex.Api, for: :mgmt
  @path "tickets"

  def email_verification(user_id, body) do
    do_post("#{@path}/email-verification", Map.put(body, :user_id, user_id))
  end

  def password_change(body) do
    do_post("#{@path}/password-change", body)
  end
end