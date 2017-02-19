class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: /\w{2,}\@\w+\.\w{2,3}/, message: "please enter a valid email"  }
  validates :user_name, presence: true
  validates :user_name, uniqueness: true
  validates :user_name, length: { minimum: 2} 
end
