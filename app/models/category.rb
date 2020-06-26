class Category < ApplicationRecord
  has_many :join_category_games
  has_many :games, through: :join_category_games
  has_many :responses
end
