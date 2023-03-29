defmodule TcgBotConsumer do
  use Nostrum.Consumer

  alias Nostrum.Api

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    IO.inspect(msg)

    case msg.content do
      "!tcg help" ->
        Api.create_message(
          msg.channel_id,
          "TCG Bot Help\nCommands:\n!tcg fetch <name> : displays the named card if found on Scryfall's API\n!tcg help: display bot commands"
        )

      "!tcg fetch " <> name ->
        Api.create_message(msg.channel_id, TcgBotFetch.fetch(name))

      _ ->
        :ignore
    end
  end

  # Default event handler, if you don't include this, your consumer WILL crash if
  # you don't have a method definition for each event type.
  def handle_event(_event) do
    :noop
  end
end
