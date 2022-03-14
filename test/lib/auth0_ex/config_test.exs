defmodule Auth0Ex.ConfigTest do
  use ExUnit.Case

  alias Auth0Ex.Config

  describe "domain/0" do
    setup do
      original = Application.get_env(:auth0_ex, :domain)

      on_exit(fn ->
        Application.put_env(:auth0_ex, :domain, original)
        Application.put_env(:auth0_ex, :custom_domain, false)
      end)

      :ok
    end

    test "domain is returned" do
      assert "brighterlink.auth0.com" = Config.domain()
    end

    test "custom domain is specified" do
      Application.put_env(:auth0_ex, :custom_domain, true)
      Application.put_env(:auth0_ex, :domain, "auth.example.com")

      assert "auth.example.com" == Config.domain()
    end

    test "deprecated domain is specified" do
      Application.put_env(:auth0_ex, :domain, "invalid")

      assert_raise(
        ArgumentError,
        ~r/the domain specified must be a fully qualified domain name/,
        fn ->
          Config.domain()
        end
      )
    end
  end

  describe "mgmt_client_id/0" do
    setup do
      original = Application.get_env(:auth0_ex, :mgmt_client_id)
      on_exit(fn -> Application.put_env(:auth0_ex, :mgmt_client_id, original) end)
      :ok
    end

    test "returns the set value" do
      Application.put_env(:auth0_ex, :mgmt_client_id, "foo")
      assert "foo" == Config.mgmt_client_id()
    end

    test "returns nil if not set" do
      Application.delete_env(:auth0_ex, :mgmt_client_id)
      assert nil == Config.mgmt_client_id()
    end
  end

  describe "mgmt_client_secret/0" do
    setup do
      original = Application.get_env(:auth0_ex, :mgmt_client_secret)
      on_exit(fn -> Application.put_env(:auth0_ex, :mgmt_client_secret, original) end)
      :ok
    end

    test "returns the set value" do
      Application.put_env(:auth0_ex, :mgmt_client_secret, "foo")
      assert "foo" == Config.mgmt_client_secret()
    end

    test "returns nil if not set" do
      Application.delete_env(:auth0_ex, :mgmt_client_secret)
      assert nil == Config.mgmt_client_secret()
    end
  end

  describe "mgmt_token/0" do
    setup do
      original = Application.get_env(:auth0_ex, :mgmt_token)
      on_exit(fn -> Application.put_env(:auth0_ex, :mgmt_token, original) end)
      :ok
    end

    test "returns the set value" do
      Application.put_env(:auth0_ex, :mgmt_token, "foo")
      assert "foo" == Config.mgmt_token()
    end

    test "returns nil if not set" do
      Application.delete_env(:auth0_ex, :mgmt_token)
      assert nil == Config.mgmt_token()
    end
  end

  describe "http_opts/0" do
    setup do
      original = Application.get_env(:auth0_ex, :http_opts)
      on_exit(fn -> Application.put_env(:auth0_ex, :http_opts, original) end)
      :ok
    end

    test "returns the set value" do
      Application.put_env(:auth0_ex, :http_opts, foo: :bar)
      assert [foo: :bar] == Config.http_opts()
    end

    test "returns an empty list if not set" do
      Application.delete_env(:auth0_ex, :http_opts)
      assert [] == Config.http_opts()
    end
  end

  describe "user_agent/0" do
    setup do
      original = Application.get_env(:auth0_ex, :user_agent)
      on_exit(fn -> Application.put_env(:auth0_ex, :user_agent, original) end)
      :ok
    end

    test "returns the set value" do
      Application.put_env(:auth0_ex, :user_agent, "MyCustomAgent <http://example.com>")
      assert "MyCustomAgent <http://example.com>" == Config.user_agent()
    end

    test "returns an empty list if not set" do
      Application.delete_env(:auth0_ex, :user_agent)
      assert "Auth0Ex <https://github.com/techgaun/auth0_ex>" == Config.user_agent()
    end
  end
end
