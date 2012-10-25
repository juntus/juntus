require 'spec_helper'

describe WelcomeController do
  describe :routing do
    it {
      get("/").should route_to(controller: "welcome", action: "index")
    }
    it "routes to #quem_somos" do
      get("/quem_somos").should route_to("welcome#quem_somos")
    end    
  end
end
