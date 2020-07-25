defmodule PingElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PingElixirWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PingElixir.PubSub},
      # Start the Endpoint (http/https)
      PingElixirWeb.Endpoint
      # Start a worker by calling: PingElixir.Worker.start_link(arg)
      # {PingElixir.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PingElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PingElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
