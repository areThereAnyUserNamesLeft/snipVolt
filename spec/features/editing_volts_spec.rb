require "rails_helper"


Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

RSpec.feature "Users can edit existing volts" do
     let(:user) {FactoryGirl.create(:user)}
     let(:volt){FactoryGirl.create(:volt, name: "My snipVolt", project_name: "My first volt", default_licence: "MIT")}

    before do
        login_as(user)
        assign_role!(user, :viewer,volt)

        visit "/"

        click_link "My snipVolt"
        click_link "Update volt?"
    end
    scenario "with volt details" do
        fill_in "Name", with: "Hello world"
        click_button "Make volt?"
        expect(page).to have_content "Volt has been updated"
        expect(page).to have_content "Hello world"
    end
    scenario "with volt wrong details" do
        fill_in "Name", with: ""
        click_button "Make volt?"
        expect(page).to have_content "Volt has not been updated"
    end
end
