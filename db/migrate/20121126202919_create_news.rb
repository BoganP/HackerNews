class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :link
      t.string :user_id

      t.timestamps
    end
  end
end
