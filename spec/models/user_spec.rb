require 'rails_helper'

describe User do
  before { @user = User.new(name: "王栋", email: "secondrocker@gmail.com",password: "wa123456") }
  subject{@user}
  it{should respond_to :name}
  it{should respond_to :email}
  it{should respond_to :updated_at}
  it{should respond_to :id}
  it{should respond_to :password_digest}
  it{should respond_to :password_confirmation}
  describe "when name is not present" do
    before{@user.name = ''}
    it{should_not be_valid}
  end
  it{should be_valid}

  describe "when email is not present" do
    before{@user.email = ''}
    it{ should_not be_valid}
  end

  describe "when name is too long" do
    before{@user.name = "a"*51}
    it{should_not be_valid}
  end

  it "should be invalid" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.
      foo@bar_baz.com foo@bar+baz.com -ddd@qq.com ssfsfsf@__123.com]
    addresses.each do|address|
      @user.email = address
      expect(@user).not_to be_valid
    end
  end

  describe "ununique email shoud be invalid" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end
    it{should_not be_valid}
  end

  describe "upcase email should also be invalid" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email=user_with_same_email.email.upcase
      user_with_same_email.save
    end
    it{should_not be_valid}
  end

end
