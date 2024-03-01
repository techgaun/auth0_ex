defmodule Auth0Ex.Mixfile do
  use Mix.Project

  @source_url "https://github.com/techgaun/auth0_ex"
  @version "0.9.0"

  def project do
    [
      app: :auth0_ex,
      version: @version,
      elixir: "~> 1.7",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      preferred_cli_env: [
        vcr: :test,
        "vcr.delete": :test,
        "vcr.check": :test,
        "vcr.show": :test
      ],
      deps: deps(),
      package: package(),
      description: "An elixir client library for Auth0",
      source_url: @source_url,
      docs: docs()
    ]
  end

  def application do
    [
      applications: [:logger, :httpoison, :jason],
      mod: {Auth0Ex.Application, []}
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 2.2"},
      {:jason, "~> 1.4"},
      {:credo, "~> 1.6", only: [:dev, :test]},
      {:exvcr, "~> 0.15", only: :test},
      {:ex_doc, "~> 0.31", only: [:dev]}
    ]
  end

  defp package do
    [
      maintainers: [
        "Samar Acharya"
      ],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      extras: ["README.md"],
      source_ref: "v#{@version}",
      source_url: @source_url
    ]
  end
end
