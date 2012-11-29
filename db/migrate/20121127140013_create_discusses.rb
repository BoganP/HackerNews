class CreateDiscusses < ActiveRecord::Migration
  def change
    create_table :discusses do |t|
      t.string :comment
      t.integer :news_id

      t.timestamps
    end
  end
end
