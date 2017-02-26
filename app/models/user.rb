class User < ApplicationRecord
  has_secure_password
  has_many :neighborhood_choices
  has_many :neighborhoods, through: :neighborhood_choices

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: /\w{2,}\@\w+\.\w{2,3}/, message: "please enter a valid email"  }
  validates :user_name, presence: true
  validates :user_name, uniqueness: true
  validates :user_name, length: { minimum: 2} 

   
  def user_neighborhoods
    @users.each do |user|
      neighborhood_choices(neighborhood_id)
    end
  end


  # def compare_answers
  #   users.each do |them|
  #     answers_in_common = them.id & @current_user.id
  #   end
  # end
#should pass in a parameter to compare it to. general compare method could compare smaller methods

end


