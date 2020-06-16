class Game < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :histories
  has_many :users, through: :histories
  has_many :join_category_game
  has_many :categories, through: :join_category_game
end
