class AddTimeRemainingToUserTest < ActiveRecord::Migration
  def change
    add_column :user_tests, :time_remaining, :integer
  end
end
