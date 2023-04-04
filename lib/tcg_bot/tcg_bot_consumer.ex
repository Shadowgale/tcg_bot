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
          TcgBotHelp.help()
        )

      "!tcg fetch name " <> name ->
        {url, price} = TcgBotFetch.fetch_price(name)

        if(price == 0) do
          Api.create_message(msg.channel_id, url)
        else
          Api.create_message(msg.channel_id, url)
          Api.create_message(msg.channel_id, price)
        end

      "!tcg fetch random" ->
        {url, price} = TcgBotFetch.fetch_random()
        Api.create_message(msg.channel_id, url)
        Api.create_message(msg.channel_id, price)

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
