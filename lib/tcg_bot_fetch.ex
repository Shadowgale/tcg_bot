defmodule TcgBotFetch do
  def fetch(name) do
    # IO.inspect(URI.parse("https://api.scryfall.com/cards/named?format=image&fuzzy="<>name))
    URI.parse("https://api.scryfall.com/cards/named?format=image")
    |> URI.append_query(URI.encode_query(%{fuzzy: name}))
    |> URI.to_string()

    |> check_url()
  end

  defp check_url(url) do
    response = HTTPoison.get!(url)
    IO.inspect(response)

    if response.status_code == 404 do
      jason_map = Jason.decode!(response.body)
      IO.inspect(jason_map)
      %{"details" => details} = jason_map
      details
    else
      url
    end
  end
end
