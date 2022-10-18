defmodule Uts46.MixProject do
  use Mix.Project

  @version "0.2.0"

  def project do
    [
      app: :uts46,
      version: @version,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.26.0"},
      {:rustler_precompiled, "~> 0.5.2"}
    ]
  end
end
