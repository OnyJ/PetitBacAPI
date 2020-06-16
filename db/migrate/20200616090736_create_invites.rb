class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.integer :guest_id
      t.integer :game_id

      t.timestamps
    end
  end
end
