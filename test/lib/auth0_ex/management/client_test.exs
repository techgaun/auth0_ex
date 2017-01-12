defmodule Auth0Ex.Management.ClientTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  alias Auth0Ex.Management.Client

  setup_all do
    HTTPoison.start
  end

  test "get all client" do
    use_cassette "client_all" do
      {:ok, all_clients} = Client.all(%{fields: "name"})
      assert is_list(all_clients)
      [client | _] = all_clients
      assert map_size(client) === 1
    end
  end
end
