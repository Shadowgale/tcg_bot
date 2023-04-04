defmodule TcgBotFetch do
  def fetch_price(name) do
    # Checks if the card was found on the API using the check_url/1 function, returns a tuple which contains the card image's url and its price
    parse = URI.parse("https://api.scryfall.com/cards/named")
    query = URI.append_query(parse, URI.encode_query(%{fuzzy: name}))
    url_string = URI.to_string(query)
    checked_url = check_url(url_string)

    case checked_url do
      {:ok, url} ->
        response = HTTPoison.get!(url)
        map = Jason.decode!(response.body)
        price = map["prices"]["usd"]
        image_url = map["image_uris"]["normal"]

        if(price != nil) do
          price_string = "Price: $" <> price
          {image_url, price_string}
        else
          {image_url, "Couldn't find the price in usd"}
        end

      {:error, details} ->
        {details, 0}
    end
  end

  def fetch_random() do
    # fetches a random card from the API, returns a tuple with the card image's url and its price
    response = HTTPoison.get!("https://api.scryfall.com/cards/random")
    map = Jason.decode!(response.body)
    url = map["image_uris"]["normal"]
    price = map["prices"]["usd"]

    if(price != nil) do
      price_string = "Price: $" <> price
      {url, price_string}
    else
      {url, "couldn't find the price in usd"}
    end
  end

  defp check_url(url) do
    # Returns the card image's url if found, else returns the error message
    response = HTTPoison.get!(url)

    if response.status_code == 404 do
      %{"details" => details} = Jason.decode!(response.body)
      {:error, details}
    else
      {:ok, url}
    end
  end
end
