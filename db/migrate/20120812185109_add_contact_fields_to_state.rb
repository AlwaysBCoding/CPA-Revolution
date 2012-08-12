class AddContactFieldsToState < ActiveRecord::Migration
  def change
    
    add_column :states, :board_name, :string
    add_column :states, :address, :text
    add_column :states, :telephone_number, :string
    add_column :states, :fax_number, :string
    add_column :states, :email_address, :string
    add_column :states, :website, :string
    
  end
end
