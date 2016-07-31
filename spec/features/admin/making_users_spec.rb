require "rails_helper"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

RSpec.feature "Admins can spawn users" do
     let(:admin) {FactoryGirl.create(:user, :admin)}

    before do
        login_as(admin)
        visit "/"
        click_link "#{admin.email}"
        click_link "Spawn user"
        #intetionally repeated
        click_link "Spawn user"
    end
    scenario "with valid details", js:true do
        find("#user_password").set("password")
        find('#user_email').set("newbie@example.com")
        click_button "Create User"
        expect(page).to have_content "User spawned"
        end
    scenario "when new user is an admin" do
        find("#user_password").set("password")
        find('#user_email').set("admin@example.com")
        check "Create as admin?"
        click_button "Create User"
        expect(page).to have_content "User spawned"
        expect(page).to have_content "admin@example.com (Admin)"
    end
end
