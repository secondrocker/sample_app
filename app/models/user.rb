class User < ActiveRecord::Base
  validates :name , presence:true,length:{maximum:50}
  validates :email, presence:true,format:{with:/\A\w+[\w\-.]@[a-z\d\-.]+\.[a-z]+\z/i},
    uniqueness:{case_sensitive:false}
  has_secure_password
  validates :password,length:{minimum:6}
  before_save do
    self.email = email.downcase
  end
end
