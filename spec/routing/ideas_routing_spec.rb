# -*- encoding : utf-8 -*-
require "spec_helper"

describe IdeasController do
  describe "routing" do
    it "recognizes and generates #new" do
      get("/ideas/new").should route_to(:controller => "ideas", :action => "new")
      new_idea_path.should == "/ideas/new"
    end
  end
end