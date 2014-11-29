require 'rails_helper'

describe "Static pages" do
  let(:base_title){"Ruby on Rails Tutorial Sample App"}
  subject{page}
  shared_examples_for "All static page" do
    it{ should have_content(heading) }
    it{ should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    let(:heading){"Sample App"}
    let(:page_title){""}
    before{visit home_path}
    it_should_behave_like "All static page"
    it{ should_not have_title("Home") }
  end

  describe "Help page" do
    let(:heading){"Help"}
    let(:page_title){"Help"}
    before{visit help_path}
    it_should_behave_like "All static page"
  end

  describe "About page" do
    let(:heading){"About Us"}
    let(:page_title){"About Us"}
    before{visit about_path}
    it_should_behave_like "All static page"
  end

  describe "Contact Us" do
    let(:heading){"Contact Us"}
    let(:page_title){"Contact Us"}
    before{visit contact_path}
    it_should_behave_like 'All static page'
  end

  describe "Sign up" do
    let(:heading){"Sign up"}
    let(:page_title){"Sign up"}
    before{visit signup_path}
    it_should_behave_like 'All static page'
  end

  it "should have the right link" do
    visit root_path
    click_link "About"
    expect(page).to have_content "About Us"
    click_link "Contact"
    expect(page).to have_content "Contact Us"
    click_link "Home"
    expect(page).to have_content "Sample App"
    click_link "Sign up now!"
    expect(page).to have_content "Sign up"
    click_link "Help"
    expect(page).to have_content "Help"
    click_link "sample app"
    expect(page).to have_content "Sample App"
  end
end
