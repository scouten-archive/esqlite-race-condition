defmodule Rc.Mixfile do
  use Mix.Project

  def project do
    [app: :rc,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:esqlite, :logger]]
  end

  defp deps do
    [{:esqlite, "~> 0.2.0"}]
  end
end
