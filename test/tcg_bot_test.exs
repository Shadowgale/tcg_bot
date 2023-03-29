defmodule TcgBotTest do
  use ExUnit.Case
  doctest TcgBot

  test "greets the world" do
    assert TcgBot.hello() == :world
  end
end
