defmodule TcgBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :tcg_bot,
      version: "0.1.0",
      elixir: "~> 1.14",
      # start_permanent: Mix.env() == :prod,
      start_permanent: true,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {TcgBot.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dotenv, "~> 3.1"},
      {:httpoison, "~> 2.1"},
      {:nostrum, "~> 0.6"},
      {:jason, "~> 1.4"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
