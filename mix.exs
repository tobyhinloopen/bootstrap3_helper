defmodule Bootstrap3Helper.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bootstrap3_helper,
      version: "0.0.1",
      elixir: "~> 1.2",
      elixirc_paths: ["lib", "web"],
      deps: [
        {:phoenix_html, "~> 2.6"}
      ]
    ]
  end
end
