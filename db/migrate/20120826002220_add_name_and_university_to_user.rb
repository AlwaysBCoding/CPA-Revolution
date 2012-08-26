class AddNameAndUniversityToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :university, :string, :default => "CPA Revolution"
  end
end
