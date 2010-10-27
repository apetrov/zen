class CreateGroupSpaces < ActiveRecord::Migration
  def self.up
    create_table :group_spaces do |t|
      t.integer :group_id
      t.integer :space_id

      t.timestamps
    end
  end

  def self.down
    drop_table :group_spaces
  end
end
