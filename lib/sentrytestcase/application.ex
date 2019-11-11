defmodule Sentrytestcase.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      {Task.Supervisor, name: SentrytestcaseWeb.TemporaryTaskSupervisor, restart: :temporary},
      # Start the endpoint when the application starts
      SentrytestcaseWeb.Endpoint
      # Starts a worker by calling: Sentrytestcase.Worker.start_link(arg)
      # {Sentrytestcase.Worker, arg},
    ]

    {:ok, _} = Logger.add_backend(Sentry.LoggerBackend)

    Logger.configure_backend(Sentry.LoggerBackend,
      include_logger_metadata: true,
      ignore_plug: true
    )

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sentrytestcase.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SentrytestcaseWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
