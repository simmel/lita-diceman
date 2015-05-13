require "lita"
require 'securerandom'

module Lita
  module Handlers
    class Diceman < Handler

      route(/^!dice\s+(.*)/, :dice!, help: { "!dice answer one;answer two[;…]" => "Gives you a random answer." })
      route(/^?dice\s+(.+?)\? (.*)/, :dice?, help: { "?dice Which is the correct answer? answer one;answer two[;…]" => "Gives you a random answer to your question." })

      def dice!(response)
        answers = response.match_data.captures.join.split(/ ?; ?/)
        response.reply("the dice commands: " + answers[SecureRandom.random_number(answers.size)])
      end

      def dice?(response)
        question = response.match_data.captures[0]
        answers = response.match_data.captures[1].split(/ ?; ?/)
        answer = answers[SecureRandom.random_number(answers.size)]
        response.reply(question + ":" + answer)
      end

    end

    Lita.register_handler(Diceman)
  end
end
