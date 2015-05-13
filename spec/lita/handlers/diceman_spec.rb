require "spec_helper"

describe Lita::Handlers::Diceman, lita_handler: true do

    it { is_expected.to route_command("!dice answer one;answer two").to(:dice!) }
    it { is_expected.to route_command("?dice Which is the correct answer? answer one;answer two").to(:dice?) }

    it "gives an random answer when using !dice" do
        answers = ["answer one", "answer two", "answer three"]
        send_message("!dice " + answers.join(";"))
        reply = $1 if replies.last =~ /^the dice commands: (.*)/
        expect(answers.include?(reply))
    end

end
