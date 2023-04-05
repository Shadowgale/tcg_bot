import Config

config(
  :nostrum,
  # The token of your bot as a string
    [{:token, ""},
    {:gateway_intents, :all}]
  )

if File.exists?("config/secret.exs"), do: import_config("secret.exs")
