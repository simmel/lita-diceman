require "lita"
require 'securerandom'

module Lita
  module Handlers
    class Diceman < Handler

      route(/^!dice\s+(.*)/, :dice!, help: { "!dice answer one;answer two[;…]" => "Gives you a random answer." })

      def dice!(response)
        answers = response.match_data.captures.join.split(/ ?; ?/)
        response.reply("the dice commands: " + answers[SecureRandom.random_number(answers.size)])
      end

    end

    Lita.register_handler(Diceman)
  end
end
