defmodule Auth0Ex.Management.Client do
  @moduledoc """
  A module representing client on Auth0
  """

  use Auth0Ex.Api
  @path "clients"

  def get do
    get(@path, %{})
  end
end
