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


# -----------------------------
# controller

@me = User.find(2)
@potential_roommates = User.all


# view
# @users.each do |user|
#   <h1><%= user.name %></h1>
#   <% @user.common_neighborhoods(user).each do |loc| %>
#     <li><%= loc %></li>
#   <% end %>
# end
# -----------------------------

   
  def common_neighborhoods(other_user)
    my_neighborhoods = self.neighborhoods
    their_neighborhoods = other_user.neighborhoods
    common =[]

    hood_arr = my_neighborhoods.select { |my_neighborhood| their_neighborhoods.include?(my_neighborhood)}
      hood_arr.each do |hood|
        if common.include?(hood) == false
          common << hood[:name]
        end
      end
    return common.join(", ")
    #this goes through each of my neighborhoods, sees if their hoods include it, then return it if it does. i didnt name this with a variable since it will be the last thing that gets returned 
  end

  def answer_keys(user, other_user)
    keys = [:has_pets, :pets, :gender, :gender_pref]
    keys.each do |key|
      if user[key] == other_user[key]
        return "#{key} " + user[:key].to_s 
      end
    end
  end
  # this works & returns the keyname and value if they match but it doesn't include correct logic yet to say whether its the acceptable answer to the current(other) user

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

  #both of these work to pull hash info

  # def compare_answers(other_user)
  #   answers_in_common = self[:min_roommates] & other_user[:min_roommates]
  #   p answers_in_common
  # end
#should pass in a parameter to compare it to. general compare method could compare smaller methods



end


