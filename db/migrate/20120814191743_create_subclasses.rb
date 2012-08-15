class CreateSubclasses < ActiveRecord::Migration
  def change
    create_table :subclasses do |t|
      t.integer :category_id
      t.string :name

      t.timestamps
    end
  end
end
