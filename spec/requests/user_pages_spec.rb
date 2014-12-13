require 'rails_helper'
include ApplicationHelper
describe "User Pages" do
  subject{page}

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "signup page" do
    before{ visit signup_path }
    let(:submit) { "Create my account" }
    describe "sign up user" do
      before do
        fill_in "Name",with:"王栋"
        fill_in "Email",with:"secondrocker@gmail.com"
        fill_in "Password",with:"123456"
        fill_in "Confirmation",with:"123456"
      end
      describe "with invalid information" do
        it "should not create a user" do
          fill_in "Email",with:"123"
          expect{click_button submit}.not_to change(User,:count)
        end
      end

      describe "with valid information" do
        it "should create a user" do
          expect{click_button submit}.to change(User,:count).by(1)
        end
      end
    end
  end
end
