# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Idea do
  describe :mass_assignment do
    [:description, :short_description, :title].each do |attr|
      it { should allow_mass_assignment_of(attr) }
    end
    [:user_id].each do |attr|
      it { should_not allow_mass_assignment_of(attr) }
    end
  end
  
  describe :validations do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:short_description) }
  end
  
  describe :associations do
    it { should have_many(:registrations)}
    it { should have_many(:users)}
  end
  
  describe "to_param" do
    let(:idea) { Factory.create(:idea, id: 100, title: "Minha idéia e muito boa") }
    
    it "should url concatenate id and title" do
      idea.to_param.should == [idea.id,idea.title.parameterize].join("-")
    end    
  end
end