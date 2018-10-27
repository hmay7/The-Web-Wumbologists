class AddnumfammembersTofamilies < ActiveRecord::Migration[5.2]
  def change
  	add_column :families, :num_family_members, :string
  end
end
