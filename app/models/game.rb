class Game < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :histories, dependent: :destroy
  has_many :users, through: :histories
  has_many :join_category_game, dependent: :destroy
  has_many :categories, through: :join_category_game
end
