defmodule Bootstrap3Helper.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bootstrap3_helper,
      version: "0.0.1",
      elixir: "~> 1.2",
      elixirc_paths: elixirc_paths(Mix.env),
      deps: [
        {:phoenix_html, "~> 2.6"},
        {:floki, "~> 0.10.0", only: :test}
      ]
    ]
  end

  defp elixirc_paths(:test), do: ~w{lib web test/support}
  defp elixirc_paths(_), do: ~w{lib web}
end
