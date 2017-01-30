defmodule Auth0Ex.Mixfile do
  use Mix.Project

  def project do
    [app: :auth0_ex,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     preferred_cli_env: [
       vcr: :test, "vcr.delete": :test, "vcr.check": :test, "vcr.show": :test
     ],
     deps: deps(),
     package: package(),
     description: "An elixir client library for Auth0",
     source_url: "https://github.com/techgaun/auth0_ex",
     docs: [extras: ["README.md"]]
   ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison, :poison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, "~> 0.9 or ~> 0.10"},
      {:poison, "~> 2.0 or ~> 3.0"},
      {:exvcr, "~> 0.8", only: :test},
      {:ex_doc, "~> 0.14.5", only: [:dev]}
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
