require "rails_helper"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

RSpec.feature "Admins can archive users" do
     let(:admin_user) {FactoryGirl.create(:user, :admin)}
     let(:user) {FactoryGirl.create(:user)}
    before do
        login_as(admin_user)
    end
    scenario "sucessfully" do
        visit admin_user_path user
        click_link "Archive User"
        expect(page).to have_content "User archived"
        expect(page).not_to have_content user.email
    end
    scenario "ut cannot achive themselves" do
        visit admin_user_path admin_user
        click_link "Archive User"
        expect(page).to have_content "Cannot archive yourself"
    end


end
