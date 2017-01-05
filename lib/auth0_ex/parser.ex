defmodule Auth0Ex.Parser do
  @moduledoc """
  Parser to parse all the responses from Auth0 API endpoints
  """

  @type status_code :: integer
  @type response :: {:ok, [struct]} | {:ok, struct} | :ok | {:error, map, status_code} | {:error, map} | any

  @doc """
  Parses the response from auth0 api calls
  """
  @spec parse(tuple) :: response
  def parse(response) do
    case response do
      {:ok, %HTTPoison.Response{body: body, headers: headers, status_code: status}} when status in [200, 201] ->
        {:ok, Poison.decode!(body)}

      {:ok, %HTTPoison.Response{body: _, headers: _, status_code: 204}} ->
        :ok

      {:ok, %HTTPoison.Response{body: body}, status_code: status} when status in [400, 401, 403, 404, 429] ->
        {:error, Poison.decode!(body)}

      {:ok, %HTTPoison.Response{body: body, headers: _, status_code: status}} ->
        {:error, body, status}

      {:error, %HTTPoison.Error{id: _, reason: reason}} ->
        {:error, %{reason: reason}}
      _ ->
        response
    end
  end
end
