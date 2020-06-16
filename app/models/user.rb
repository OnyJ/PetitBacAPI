class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, 
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

  has_many :games
  has_many :histories
  has_many :games, through: :history
  # has_many :friendships
  # has_many :friends, through: :friendships
  # has_many :received_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
end
