defmodule TcgBotFetch do
  def fetch(name) do
    URI.parse("https://api.scryfall.com/cards/named?format=image")
    |> URI.append_query(URI.encode_query(%{fuzzy: name}))
    |> URI.to_string()
    |> check_url()
  end

  defp check_url(url) do
    response = HTTPoison.get!(url)

    if response.status_code == 404 do
      %{"details" => details} = Jason.decode!(response.body)
      details
    else
      url
    end
  end
end
