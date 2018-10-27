class RenameNameinshelterstoname < ActiveRecord::Migration[5.2]
  def change
  	rename_column :shelters, :Name, :name
  end
end
