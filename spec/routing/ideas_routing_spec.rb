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
    
    it "recognizes and generates #edit" do
      get("/ideas/1/editar").should route_to(:controller => "ideas", :action => "edit", :id => "1")
      edit_idea_path("1").should == "/ideas/1/editar"
    end
    
    it "recognizes and generates #update" do
      put("/ideas/1").should route_to(:controller => "ideas", :action => "update", :id => "1")
    end
  end
end