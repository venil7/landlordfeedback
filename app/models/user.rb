class User < ActiveRecord::Base
  has_many :properties
  has_many :feedbacks
  has_many :entries
  has_many :comments
  def full_name
    return "#{name} #{surname}"
  end
  def self.add_if_not_present(user)
    @user = self.find_by_alias(user[:alias])
    if @user == nil
      @user = self.new(user)  
      @user.save
    end
    @user.id
  end
end
