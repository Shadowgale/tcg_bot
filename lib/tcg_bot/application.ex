defmodule TcgBot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # {Finch, name: Finch},
      TcgBot
      # Starts a worker by calling: TcgBot.Worker.start_link(arg)
      # {TcgBot.Worker, arg}

    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TcgBot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
