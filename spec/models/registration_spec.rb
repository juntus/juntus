require 'spec_helper'

describe Registration do
  describe :associations do
    it { should belong_to(:user) }
    it { should belong_to(:idea) }
  end
end
