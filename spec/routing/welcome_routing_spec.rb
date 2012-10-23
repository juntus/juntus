require 'spec_helper'

describe WelcomeController do
  describe :routing do
    it {
      get("/").should route_to(controller: "welcome", action: "index")
    }
  end
end
