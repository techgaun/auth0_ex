defmodule Auth0Ex.Parser do
  @moduledoc """
  Parser to parse all the responses from Auth0 API endpoints
  """

  @type status_code :: integer
  @type response ::
          {:ok, [struct]} | {:ok, struct} | :ok | {:error, map, status_code} | {:error, map} | any

  @doc """
  Parses the response from auth0 api calls
  """
  @spec parse(tuple) :: response
  def parse(response) do
    case response do
      {:ok, %HTTPoison.Response{body: body, headers: headers, status_code: status}}
      when status in [200, 201] ->
        parse_json_or_html(headers, body)

      {:ok, %HTTPoison.Response{body: _, headers: _, status_code: 204}} ->
        :ok

      {:ok, %HTTPoison.Response{body: body, headers: _, status_code: status}} ->
        {:error, body, status}

      {:error, %HTTPoison.Error{id: _, reason: reason}} ->
        {:error, %{reason: reason}}

      _ ->
        response
    end
  end

  defp parse_json_or_html(headers, body) do
    case json_content_type?(headers) do
      true -> {:ok, Jason.decode!(body)}
      false -> {:ok, body}
    end
  end

  defp json_content_type?(headers) do
    get_media_type(headers) == "application/json"
  end

  defp get_media_type(headers) do
    Enum.find_value(headers, "application/octet-stream", fn
      {header, media_type} when header in ["Content-Type", "content-type"] ->
        media_type
        |> String.split(";", parts: 2)
        |> hd()

      _ ->
        false
    end)
  end
end
