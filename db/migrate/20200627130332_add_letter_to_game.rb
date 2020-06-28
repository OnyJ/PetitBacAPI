class AddLetterToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :letter, :string, default: ""
  end
end
