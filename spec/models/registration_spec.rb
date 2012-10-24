require 'spec_helper'

describe Registration do
  it { should allow_mass_assignment_of(:user)}
  
  describe :associations do
    it { should belong_to(:user) }
    it { should belong_to(:idea) }
  end
end
