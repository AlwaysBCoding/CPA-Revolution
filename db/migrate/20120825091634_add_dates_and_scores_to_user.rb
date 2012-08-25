class AddDatesAndScoresToUser < ActiveRecord::Migration
  def change
    add_column :users, :far_date, :date
    add_column :users, :reg_date, :date
    add_column :users, :bec_date, :date
    add_column :users, :aud_date, :date
    add_column :users, :far_score, :integer
    add_column :users, :reg_score, :integer
    add_column :users, :bec_score, :integer
    add_column :users, :aud_score, :integer
  end
end
