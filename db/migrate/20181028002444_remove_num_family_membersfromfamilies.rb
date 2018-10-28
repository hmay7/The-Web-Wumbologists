class RemoveNumFamilyMembersfromfamilies < ActiveRecord::Migration[5.2]
  def change
  	remove_column :families, :NumFamilyMembers, :integer
  end
end
