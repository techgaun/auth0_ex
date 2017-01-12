defmodule Auth0Ex.Api do
  @moduledoc """
  The main API module supposed to be used by individual authentication and management API modules
  """

  defmacro __using__(_opts) do
    quote do
      alias Auth0Ex.Parser
      import Auth0Ex.Utils

      def build_url(path, params) do
        "#{base_url}#{path}?#{URI.encode_query(params)}"
      end

      def do_get(path, params) when is_map(params) do
        path
        |> build_url(params)
        |> HTTPoison.get(req_header)
        |> Parser.parse
      end

      def do_get(path, params) when is_list(params) do
        do_get(path, Enum.into(params, %{}))
      end

      def do_post(path, body) do
        path
        |> build_url(%{})
        |> HTTPoison.post(body, req_header)
        > Parser.parse
      end
    end
  end
end
