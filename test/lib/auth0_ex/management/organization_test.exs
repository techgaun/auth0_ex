defmodule Auth0Ex.Management.OrganizationTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  alias Auth0Ex.Management.Organization

  @url "https://brighterlink.auth0.com/api/v2/organizations"
  @json_headers %{"Content-Type" => "application/json; charset=utf-8"}

  setup_all do
    HTTPoison.start()
  end

  test "lists organizations without query parameters" do
    use_cassette :stub,
      url: @url <> "?",
      method: "get",
      headers: @json_headers,
      body: ~s([{"id":"org_example","name":"example"}]) do
      assert {:ok, [%{"id" => "org_example", "name" => "example"}]} = Organization.all()
    end
  end

  test "lists organizations with map or keyword query parameters" do
    use_cassette :stub,
      url: @url <> "?page=1&per_page=10",
      method: "get",
      headers: @json_headers,
      body: "[]" do
      assert {:ok, []} = Organization.all(%{page: 1, per_page: 10})
      assert {:ok, []} = Organization.all(page: 1, per_page: 10)
    end
  end

  test "gets an organization" do
    use_cassette :stub,
      url: @url <> "/org_example?",
      method: "get",
      headers: @json_headers,
      body: ~s({"id":"org_example","name":"example"}) do
      assert {:ok, %{"id" => "org_example", "name" => "example"}} =
               Organization.get("org_example")
    end
  end

  test "creates an organization with a JSON body" do
    use_cassette :stub,
      url: @url <> "?",
      method: "post",
      request_body: ~s({"name":"example","display_name":"Example"}),
      headers: @json_headers,
      status_code: 201,
      body: ~s({"id":"org_example","name":"example","display_name":"Example"}) do
      assert {:ok, %{"id" => "org_example", "display_name" => "Example"}} =
               Organization.create(%{name: "example", display_name: "Example"})
    end
  end

  test "updates an organization with a keyword body" do
    use_cassette :stub,
      url: @url <> "/org_example?",
      method: "patch",
      request_body: ~s({"display_name":"New Name"}),
      headers: @json_headers,
      body: ~s({"id":"org_example","display_name":"New Name"}) do
      assert {:ok, %{"id" => "org_example", "display_name" => "New Name"}} =
               Organization.update("org_example", display_name: "New Name")
    end
  end

  test "deletes an organization" do
    use_cassette :stub,
      url: @url <> "/org_example?",
      method: "delete",
      status_code: 204,
      body: "" do
      assert :ok = Organization.delete("org_example")
    end
  end

  test "lists organization members" do
    use_cassette :stub,
      url: @url <> "/org_example/members?",
      method: "get",
      headers: @json_headers,
      body: ~s([{"user_id":"auth0|example","email":"member@example.com"}]) do
      assert {:ok, [%{"user_id" => "auth0|example", "email" => "member@example.com"}]} =
               Organization.members("org_example")
    end
  end

  test "lists roles for an organization member" do
    use_cassette :stub,
      url: @url <> "/org_example/members/auth0|example/roles?",
      method: "get",
      headers: @json_headers,
      body: ~s([{"id":"rol_example","name":"member"}]) do
      assert {:ok, [%{"id" => "rol_example", "name" => "member"}]} =
               Organization.member_roles("org_example", "auth0|example")
    end
  end
end
