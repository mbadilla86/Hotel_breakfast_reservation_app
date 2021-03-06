class CreateJoinTableUserReservation < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :reservations do |t|
      t.index [:user_id, :reservation_id]
      t.index [:reservation_id, :user_id]
    end
  end
end
