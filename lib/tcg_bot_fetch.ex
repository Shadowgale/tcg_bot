defmodule TcgBotFetch do
  def fetch(name) do
    # IO.inspect(URI.parse("https://api.scryfall.com/cards/named?format=image&fuzzy="<>name))
    parse = URI.parse("https://api.scryfall.com/cards/named?format=image")
    append = URI.append_query(parse, URI.encode_query(%{fuzzy: name}))
    url_string = URI.to_string(append)
    IO.inspect(url_string)
    check_url(url_string)

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
