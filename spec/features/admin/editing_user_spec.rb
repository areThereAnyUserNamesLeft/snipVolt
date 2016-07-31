require "rails_helper"

 Capybara.register_driver :selenium do |app|
   Capybara::Selenium::Driver.new(app, :browser => :chrome)
 end

RSpec.feature "Admins can alter users attributes" do
     let(:admin_user) {FactoryGirl.create(:user, :admin)}
     let(:user) {FactoryGirl.create(:user)}
    before do
        login_as(admin_user)
        visit admin_user_path(user)
        click_link "Edit User"
    end
    scenario "with valid details" do
        find('#user_email').set("newguy@example.com")
        click_button "Update User"
        expect(page).to have_content "User has been updated"
        expect(page).to have_content "newguy@example.com"
        expect(page).to_not have_content user.email
        end
    scenario "by toggling user's admin ability" do
        check "Create as admin?"
        click_button "Update User"
        expect(page).to have_content "User has been updated"
        expect(page).to have_content "#{user.email} (Admin)"
    end
end
