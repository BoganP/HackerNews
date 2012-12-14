class AddParentToDiscusses < ActiveRecord::Migration
  def up
    add_column :discusses, :parent_id, :integer
  end
  def down
  end
end
