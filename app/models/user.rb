class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, 
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

end
