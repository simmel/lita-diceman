require "spec_helper"

describe Lita::Handlers::Diceman, lita_handler: true do

    it { is_expected.to route_command("!dice answer one;answer two").to(:dice!) }

end
