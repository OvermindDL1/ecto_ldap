defmodule EctoLdap.Mixfile do
  use Mix.Project
  @description """
    An Ecto adapter for LDAP
  """

  def project do
    [app: :ecto_ldap,
     version: "0.3.0",
     elixir: "~> 1.2",
     name: "ecto_ldap",
     description: @description,
     package: package,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: [
       "coveralls": :test,
       "coveralls.detail": :test,
       "coveralls.html": :test,
       "coveralls.post": :test,
       "docs": :docs,
       "hex.docs": :docs,
     ],
     dialyzer: [
       plt_add_apps: [:ecto, :timex_ecto, :timex, :eldap],
       flags: [
         "-Wunmatched_returns",
         "-Werror_handling",
         "-Wrace_conditions",
         "-Wunderspecs",
         "-Wunknown",
         "-Woverspecs",
         "-Wspecdiffs",
       ]
     ],
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :ecto, :timex, :timex_ecto]]
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
      {:ecto, "~> 1.1 or ~> 2.0 or ~> 2.0.0-rc5"},
      {:timex, github: "bitwalker/timex", override: true},
      {:timex_ecto, "~> 1.1"},
      {:excoveralls, "~> 0.5", only: :test},
      {:ex_doc, "~> 0.11.4", only: :docs},
      {:earmark, "~> 0.2"},
      {:dialyxir, "~> 0.3", only: :dev},
    ]
  end

  defp package do
    [ maintainers: ["Jeff Weiss", "Manny Batule"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/jeffweiss/ecto_ldap"} ]
  end
end
