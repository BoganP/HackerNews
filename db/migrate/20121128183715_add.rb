class Add < ActiveRecord::Migration
  def up
    add_column :news, :user_id, :integer
    add_column :discusses, :user_id, :integer

  end

  def down
  end
end
