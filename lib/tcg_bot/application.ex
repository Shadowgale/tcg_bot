defmodule TcgBot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    opts = [strategy: :one_for_one, name: TcgBot.Supervisor]
    if Mix.env() == :test do
      children = []
      Supervisor.start_link(children, opts)
    else
      children = [TcgBot]
      Supervisor.start_link(children, opts)
    end
    # Supervisor.start_link(children, opts)
  end
end
