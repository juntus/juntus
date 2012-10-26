# -*- encoding : utf-8 -*-
require "spec_helper"

describe IdeasController do
  describe "routing" do
    it {
      get("/").should route_to(controller: "ideas", action: "index")
    }
    
    it {
      get("/ideas").should route_to(controller: "ideas", action: "index")
    }
    
    it "recognizes and generates #new" do
      get("/ideas/nova").should route_to(:controller => "ideas", :action => "new")
      new_idea_path.should == "/ideas/nova"
    end
  end
end