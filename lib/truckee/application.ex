defmodule Truckee.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TruckeeWeb.Telemetry,
      Truckee.Repo,
      {DNSCluster, query: Application.get_env(:truckee, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Truckee.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Truckee.Finch},
      # Start a worker by calling: Truckee.Worker.start_link(arg)
      # {Truckee.Worker, arg},
      # Start to serve requests, typically the last entry
      TruckeeWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Truckee.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TruckeeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
