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

        # TODO Put this in translation files?
        interrogative_words = [
          # Swedish
          "bör",
          "hur mycket",
          "hur många",
          "hur",
          "när",
          "ska",
          "skall",
          "vad",
          "var",
          "varför",
          "varifrån",
          "vem",
          "vilka",
          "vilken",
          "vilket",
          "är",
          # English
          "how many",
          "how much",
          "how",
          "what",
          "when",
          "where",
          "which",
          "who",
          "why",
        ]
        question.sub!(/\b(?:#{interrogative_words.join("|")})\b/i, answer)

        pronoun = {
          "jag" => "du",
          "dig" => "mig",
          "me" => "you",
          "i" => "you",
        }
        question.sub!(/\b(?:#{pronoun.keys.join("|")})\b/i) {|p| pronoun[p] }

        response.reply(question)
      end

    end

    Lita.register_handler(Diceman)
  end
end
