class CreateJoinTableAdminHotel < ActiveRecord::Migration[6.1]
  def change
    create_join_table :admins, :hotels do |t|
      t.index [:admin_id, :hotel_id]
      t.index [:hotel_id, :admin_id]
    end
  end
end
