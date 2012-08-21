class AddTestletandTimeToSection < ActiveRecord::Migration
  def change
    add_column :sections, :questions_per_testlet, :integer
    add_column :sections, :time_per_test, :integer
  end
end
