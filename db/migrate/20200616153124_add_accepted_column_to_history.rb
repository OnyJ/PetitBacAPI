class AddAcceptedColumnToHistory < ActiveRecord::Migration[6.0]
  def change
    add_column :histories, :accepted, :boolean, default: nil
  end
end
