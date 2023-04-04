defmodule TcgBotHelp do
  def help do
    """
      TCG Bot Help
      Commands:
      !tcg fetch name <name> : displays the named card and its price (in usd), if found on Scryfall's API
      !tcg fetch random: fetches a random card and its price
      !tcg help: display bot commands
    """

  end
end
