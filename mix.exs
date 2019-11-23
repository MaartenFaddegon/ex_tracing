defmodule ExTracing.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_tracing,
      version: "0.1.0",
      elixir: "~> 1.6",
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
      {:benchee, "~> 1.0"},
      {:benchee_html, "~> 1.0"},
      {:opencensus_elixir, "~> 0.2.0"},
      {:opencensus_zipkin, "~> 0.1.0"},
      {:opencensus_patterns, "~> 0.1.0"}
    ]
  end
end
