import Config

Dotenv.load!()

config(:nostrum,
  [{:token, System.fetch_env!("BOTKEY")}, # The token of your bot as a string
  {:gateway_intents, :all}])
