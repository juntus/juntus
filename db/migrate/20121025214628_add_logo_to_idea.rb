class AddLogoToIdea < ActiveRecord::Migration
  def self.up
    add_attachment :ideas, :logo
    add_attachment :ideas, :background
  end

  def self.down
    remove_attachment :ideas, :logo
    remove_attachment :ideas, :background
  end
end
