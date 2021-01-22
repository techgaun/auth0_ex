defmodule Auth0Ex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :auth0_ex,
      version: "0.7.0",
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
      source_url: "https://github.com/techgaun/auth0_ex",
      docs: [extras: ["README.md"]]
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
      {:httpoison, "~> 1.6"},
      {:jason, "~> 1.1"},
      {:exvcr, "~> 0.10.1", only: :test},
      {:ex_doc, "~> 0.19", only: [:dev]}
    ]
  end

  defp package do
    [
      maintainers: [
        "Samar Acharya"
      ],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/techgaun/auth0_ex"}
    ]
  end
end
