class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :section_id
      t.string :code
      t.string :name
      t.string :parent_code

      t.timestamps
    end
  end
end
