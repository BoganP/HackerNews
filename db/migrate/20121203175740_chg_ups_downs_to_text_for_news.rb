class ChgUpsDownsToTextForNews < ActiveRecord::Migration
  def up
    change_column :news, :ups, :text
    change_column :news, :downs, :text
  end

  def down
  end
end
