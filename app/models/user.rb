class User < ActiveRecord::Base
  has_many :properties
  has_many :feedbacks
  has_many :entries
  has_many :comments

  def full_name
    return "#{name} #{surname}"
  end

  #def self.add_if_not_present(user)
  #  @user = self.find_by_alias(user[:alias])
  #  if @user == nil
  #    @user = self.new(user)  
  #    @user.save
  #  end
  #  @user.id
  #end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.alias = auth["uid"]
      user.name = auth["info"]["first_name"] || auth["info"]["name"]
      user.surname = auth["info"]["last_name"] || auth["info"]["nickname"]
      user.email = auth["info"]["email"]
      user.avatar = auth["info"]["image"]
      user.provider = auth["provider"]
    end
  end

end
