class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.belongs_to :user
      t.belongs_to :idea

      t.timestamps
    end
    add_index :registrations, :user_id
    add_index :registrations, :idea_id
  end
end
