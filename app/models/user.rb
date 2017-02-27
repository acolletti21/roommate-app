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
    names = []
      users = User.all
      users.each do |user|
        user.neighborhoods.each do |neighborhood|
          names << neighborhood.name 
        end
      end
    names.join(", ")
  end

  # this works & returns the keyname and value if they match but it doesn't include correct logic yet to say whether its the acceptable answer to the current(other) user
  def answer_keys(user, other_user)
    keys = [:has_pets, :pets, :gender, :gender_pref]
    keys.each do |key|
      if user[key] == other_user[key]
        return "#{key} " + user[:key].to_s 
      end
    end
  end

  def pets_answers(user, current_user)
    count = 0
    if user.has_pets? && current_user[:pets] == false
      count = 0
    elsif current_user.has_pets? && user[:pets] == false
      count = 0
    else 
      count = 1
    end
  end

  def age_answers(user, current_user)
    count = 0
    if user.age >= current_user.min_age && user.age <= current_user.max_age
      count = 1
    elsif current_user.age >= user.min_age && current_user.age <= user.max_age
      count = 1
    else
      count = 0
    end
  end

  # def compare_answers(other_user)
  #   result = {}
  #   @users = User.all
  #     @users.each {|k, v| result[k] = other_user[k] if other_user[k] == v }
  #   p result 
  # end

  #both of these work

  # def compare_answers(other_user)
  #   answers_in_common = self[:min_roommates] & other_user[:min_roommates]
  #   p answers_in_common
  # end
#should pass in a parameter to compare it to. general compare method could compare smaller methods



end


