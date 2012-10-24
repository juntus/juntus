# -*- encoding : utf-8 -*-
require "spec_helper"

describe RegistrationsController do
  describe "routing" do
    it "recognizes and generates #register" do
      post("/ideas/1/register").should route_to(:controller => "registrations", :action => "register", :idea_id => "1")
      register_idea_path("1").should == "/ideas/1/register"
    end
  end
end