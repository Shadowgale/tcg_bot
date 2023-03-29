import Config

Dotenv.load!()

config(
  :nostrum,
  # The token of your bot as a string
  [{:token, System.fetch_env!("BOTKEY")}, {:gateway_intents, :all}]
)
