class AddCompletedToUserTest < ActiveRecord::Migration
  def change
    add_column :user_tests, :completed, :boolean
  end
end
