require 'spec_helper'

describe WelcomeController do
  describe :routing do
    
    it "routes to #quem_somos" do
      get("/quem_somos").should route_to("welcome#quem_somos")
    end    
  end
end
