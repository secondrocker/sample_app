class User < ActiveRecord::Base
  validates :name , presence:true,length:{maximum:50}
  validates :email, presence:true,format:{with:/\A\w+[\w\-.]@[a-z\d\-.]+\.[a-z]+\z/i},
    uniqueness:{case_sensitive:false}
  has_secure_password
  validates :password,length:{minimum:6}
  before_save do
    self.email = email.downcase
  end
  before_create :create_remember_token


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  private
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
