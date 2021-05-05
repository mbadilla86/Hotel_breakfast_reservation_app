class CreateUserBreakfasts < ActiveRecord::Migration[6.1]
  def change
    create_table :user_breakfasts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :breakfast, null: false, foreign_key: true
      t.integer :place, default: 0
      t.integer :time, default: 0

      t.timestamps
    end
  end
end
