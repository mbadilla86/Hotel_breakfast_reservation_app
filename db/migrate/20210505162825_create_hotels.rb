class CreateHotels < ActiveRecord::Migration[6.1]
  def change
    create_table :hotels do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.integer :city, default: 0

      t.timestamps
    end
  end
end
