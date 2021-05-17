defmodule ServidorEmail.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application


  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: ServidorEmail.Worker.start_link(arg)
      # {ServidorEmail.Worker, arg}
      Plug.Adapters.Cowboy.child_spec(scheme: :http, plug: ServidorEmail.Router, options: [port: 8085])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ServidorEmail.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
