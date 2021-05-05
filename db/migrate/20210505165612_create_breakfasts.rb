class CreateBreakfasts < ActiveRecord::Migration[6.1]
  def change
    create_table :breakfasts do |t|
      t.references :reservation, null: false, foreign_key: true
      t.date :date, null: false

      t.timestamps
    end
  end
end
