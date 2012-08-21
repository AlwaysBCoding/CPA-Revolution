class AddSectionIdToUserTest < ActiveRecord::Migration
  def change
    add_column :user_tests, :section_id, :integer
  end
end
