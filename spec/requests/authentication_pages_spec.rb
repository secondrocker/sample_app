require 'rails_helper'

describe "Authentication" do
  subject{page}
  describe "signin page" do
    before { visit signin_path }

    describe "invalid password" do
      before{click_button "Sign in"}
      it{should have_content("Sign in")}
      it{should have_title("Sign in")}
      it{should have_selector "div.alert.alert-error"}
      describe "after visit another page" do
        before{visit signup_path}
        it{should_not have_selector "div.alert.alert-error"}
      end
    end

    describe "valid password" do
      let(:user){FactoryGirl.create(:user)}
      before do
        fill_in "Email",with:user.email.upcase
        fill_in "Password",with:user.password
        click_button "Sign in"
      end
      it{should have_title user.name}
      it{should have_link "Profile",href:user_path(user)}
      it{should have_link "Sign out",href:signout_path}
      it{should_not have_link "Sign in",href:signin_path}
    end
  end
end
