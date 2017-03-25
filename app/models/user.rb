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
  # validates :min_age, numericality: { only_integer: true } this breaks signup



  def self.all_except(user)
   where.not(id: user)
  end

  def common_neighborhoods(other_user)
    common = []
    other_user.neighborhoods.pluck(:name).each do |neighborhood|
      if self.neighborhoods.pluck(:name).include?(neighborhood)
        common << neighborhood
      end
    end
    return common.join(", ")
  end

  def add_nh_classes
    tags = []
    self.neighborhoods.each do |neighborhood|
      tags << "nh" + neighborhood.id.to_s
    end
    return tags.join(" ")
  end

  def answer_keys(other_user)
    keys = [:has_pets, :pets, :gender, :gender_pref]
    keys.each do |key|
      if self[key] == other_user[key]
        return "#{key} " + self[:key].to_s 
      end
    end
  end
  # this works & returns the keyname and value if they match but it doesn't include correct logic yet to say whether its the acceptable answer to the current(other) user

  def pet_answers(current_user)
   if self.has_pets? && current_user[:pets] == false
     count = 0
   elsif current_user.has_pets? && self[:pets] == false
     count = 0
   else 
     count = 1
   end
 end

  def age_answers(current_user)
    if self.age >= current_user.min_age && self.age <= current_user.max_age
      if current_user.age >= self.min_age && current_user.age <= self.max_age
        count = 1
      else
        count = 0
      end
    else count = 0
    end
  end

  def roommate_answers(current_user)
    if self.min_roommates >= current_user.min_roommates && self.min_roommates <= current_user.max_roommates
        count = 1
    else
        count = 0
    end
  end

  def price_answers(current_user)
    sum = (self.max_price + current_user.max_price) / 2
    if (sum - current_user.max_price) <= (sum * 0.20)
      count = 1
    else
      count = 0
    end
  end

  def gender_answers(current_user)
    if self.gender == current_user.gender_pref && current_user.gender == self.gender_pref
      count = 1
    elsif self.gender_pref == "any" && current_user.gender_pref == "any"
      count = 1
    elsif self.gender_pref == "male" && self.gender == current_user.gender_pref || current_user.gender_pref == "any"
      count = 1
    elsif current_user.gender_pref == "any" && self.gender == current_user.gender_pref
      count = 1
    else 
      count = 0
    end
  end

  def neighborhood_answers(current_user)
    list = current_user.common_neighborhoods(self)
    if list.length == 0
      count = 0
    else
      count = 1
    end
  end

  def match_percent(current_user)
    total = ( age_answers(current_user) 
      + pet_answers(current_user) 
      + roommate_answers(current_user) 
      + price_answers(current_user) 
      + gender_answers(current_user) 
      + neighborhood_answers(current_user) ) * 100 / 6
  end


  def self.sorted_by_percent(current_user, desc=true)
    sorted_results = self.all_except(current_user).sort_by { |mate| mate.match_percent(current_user) }
    sorted_results.reverse! if desc
    sorted_results
  end

end




  
  # def compare_answers(other_user)
  #   result = {}
  #   @users = User.all
  #     @users.each {|k, v| result[k] = other_user[k] if other_user[k] == v }
  #   p result 
  # end



