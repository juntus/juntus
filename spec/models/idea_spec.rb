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
end