require "rails_helper"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

RSpec.feature "Users can delete volts" do
         let(:user) {FactoryGirl.create(:user)}
    before do

    end
    scenario "successfully" do
        FactoryGirl.create(:volt, name: "My snipVolt", project_name: "My first volt", default_licence: "MIT")

        visit "/"

        click_link "My snipVolt"
        click_link "Delete volt?"
        expect(page).to have_content "Volt has been terminated with extreme prejudice"
        expect(page.current_url).to eq volts_url
        expect(page).to have_no_content "Mw snipVolt"

    end
end
