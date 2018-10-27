class CreateShelters < ActiveRecord::Migration[5.2]
  def change
    create_table :shelters do |t|

      t.timestamps
    end
  end
end
