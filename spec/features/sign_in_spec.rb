require "rails_helper"


Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

RSpec.feature "Users can view snips" do
    let!(:user) {FactoryGirl.create(:user)}

    scenario "with valid details" do
        visit "/"
        click_link "Log in?"
        fill_in "Email", with: user.email
        fill_in "Password", with: "password"
        click_button "Log in"

        expect(page).to have_content "Signed in successfully."
        expect(page).to have_content "account_box #{user.email}"
    end
end
