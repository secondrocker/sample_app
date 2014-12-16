module SessionsHelper
  attr_accessor :current_user

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token , User.encrypt(remember_token))
    self.current_user = user
  end

  def sign_out
    @current_user = nil
    cookies.delete :remember_token
  end

  def signed_in?
    !self.current_user.blank?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token:remember_token)
  end

end
