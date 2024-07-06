defmodule ElixirPosts.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ElixirPostsWeb.Telemetry,
      ElixirPosts.Repo,
      {DNSCluster, query: Application.get_env(:elixir_posts, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ElixirPosts.PubSub},
      # Start a worker by calling: ElixirPosts.Worker.start_link(arg)
      # {ElixirPosts.Worker, arg},
      # Start to serve requests, typically the last entry
      ElixirPostsWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirPosts.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixirPostsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
