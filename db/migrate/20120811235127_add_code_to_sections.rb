class AddCodeToSections < ActiveRecord::Migration
  def change
    
    add_column :sections, :code, :string
    
  end
end
