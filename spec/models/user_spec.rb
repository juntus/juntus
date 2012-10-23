require 'spec_helper'

describe User do
  describe :mass_assignment do
    [:access_token, :email, :name, :provider, :uid].each do |attr|
      it { should allow_mass_assignment_of(attr) }
    end
  end
  
  describe :validations do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
end