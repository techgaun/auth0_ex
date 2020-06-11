defmodule Auth0Ex.Management.Job do
  @moduledoc """
  A module representing jobs on Auth0
  """

  use Auth0Ex.Api, for: :mgmt
  @path "jobs"

  @doc """
  Sends a verification email for the given user

      iex> Auth0Ex.Management.Job.send_verification_email(%{user_id: "test_user_id, client_id: "test_client_id"})
  """
  def send_verification_email(body \\ %{})
      when is_map(body) do
    do_post(
      "#{@path}/verification-email",
      body
    )
  end
end
