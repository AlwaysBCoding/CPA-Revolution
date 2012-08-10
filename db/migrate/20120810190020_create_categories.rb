class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :section_id
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
