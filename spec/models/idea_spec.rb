# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Idea do
  describe :mass_assignment do
    [:description, :short_description, :title, :logo, :background].each do |attr|
      it { should allow_mass_assignment_of(attr) }
    end
    [:user_id].each do |attr|
      it { should_not allow_mass_assignment_of(attr) }
    end
  end
  
  describe :validations do
    [:title, :description, :short_description, :user_id].each do |field|
      it { should validate_presence_of(field) }
    end
  end
  
  describe :associations do
    it { should have_many(:registrations) }
    it { should have_many(:users) }
    it { should belong_to(:owner) }
  end
  
  it { Idea.new.logo.url.should == "/logos/original/missing.png" }
  it { Idea.new.background.url.should == "/backgrounds/original/missing.png" }
  
  describe "to_param" do
    let(:idea) { Factory.create(:idea, id: 100, title: "Minha idéia e muito boa") }
    
    it "should url concatenate id and title" do
      idea.to_param.should == [idea.id,idea.title.parameterize].join("-")
    end
    
    it "should separate words with '-'" do
      idea.title.parameterize.should == "minha-ideia-e-muito-boa"
    end
  end
end