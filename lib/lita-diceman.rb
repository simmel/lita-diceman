require "lita"

module Lita
  module Handlers
    class Diceman < Handler

      route(/^!dice\s+(.*)/, :dice!, help: { "!dice answer one;answer two[;…]" => "Gives you a random answer." })

      def dice!(response)
        response.reply(response.match_data.captures.join.split(/ ?; ?/).inspect)
      end

    end

    Lita.register_handler(Diceman)
  end
end
