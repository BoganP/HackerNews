class AddScore < ActiveRecord::Migration
  def up
    add_column :news, :ups, :integer
    add_column :news, :downs, :integer
    add_column :news, :score, :integer
  end

  def down
  end
end
