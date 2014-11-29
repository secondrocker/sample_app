class User < ActiveRecord::Base
  attr_accessor :password
  validates :name , presence:true,length:{maximum:50}
  validates :email, presence:true,format:{with:/\A\w+[\w\-.]@[a-z\d\-.]+\.[a-z]+\z/i},
    uniqueness:{case_sensitive:false}
  has_secure_password
  before_save do
    self.email = email.downcase
  end
end
