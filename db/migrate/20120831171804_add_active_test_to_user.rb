class AddActiveTestToUser < ActiveRecord::Migration
  def change
    add_column :users, :active_test, :integer
  end
end
