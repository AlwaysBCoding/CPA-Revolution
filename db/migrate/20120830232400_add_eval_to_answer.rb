class AddEvalToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :eval, :boolean
  end
end
