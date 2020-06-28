class AddLetterToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :letter, :string
  end
end
