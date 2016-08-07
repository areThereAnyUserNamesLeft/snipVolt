require "rails_helper"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

RSpec.feature "Users can delete volts" do
    let(:volt){FactoryGirl.create(:volt, name: "My snipVolt", project_name: "My first volt", default_licence: "MIT")}
    let(:user) {FactoryGirl.create(:user, :admin)}
    before do
        assign_role!(user, :admin, volt)
        login_as(user)
    end
    scenario "successfully" do
        visit "/"
        click_link "My snipVolt"
        click_link "Delete volt?"
        expect(page).to have_content "Volt has been terminated with extreme prejudice"
        expect(page.current_url).to eq volts_url
        expect(page).to have_no_content "My snipVolt"

    end
end
