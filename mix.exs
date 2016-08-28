defmodule UnitFun.Mixfile do
  use Mix.Project

  def project do
    [
      app: :unit_fun,
      name: "Unit Fun",
      description: """
      Library for adding units/dimensions to numeric types.
      """,
      package: [
        maintainers: ["Steve Brazier"],
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/meadsteve/unit_fun"},
      ],
      version: "0.5.3",
      elixir: "~> 1.0",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps
   ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:credo, "~> 0.4", only: [:dev, :test]},
      {:dialyxir, "~> 0.3.5", only: [:dev, :test]},
      {:ex_doc, "~> 0.13.0", only: [:dev]},
    ]
  end
end
