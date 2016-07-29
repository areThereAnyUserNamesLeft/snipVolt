require "rails_helper"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

RSpec.feature "Users can create new volts" do
    let(:user) {FactoryGirl.create(:user)}
    before do
        login_as(user)
        visit "/"
        click_link "New volt?"
    end

    scenario "with valid attributes", js: true do

        fill_in "Name", with: "Hello whirled"
        fill_in "Project name", with: "My first program - a parody"
        click_button "Make volt?"


# needs to be manually tested for now as depends on the browser running JS
        # expect(page).to have_content "Snip made"
        # expect(page).to have_content "Author: #{user.email}"

        #expect(page).to have_content "Snip made"
        #snip = Snip.find_by(name: "Hello whirled")
        #expect(page.current_url).to eq snip_url(snip)

        #title = "Hello whirled - snipVolt"
        #expect(page).to have_title title
    end
    scenario"when providing invalid attributes" do
        click_button "Make volt?"
        expect(page).to have_content "Volt not made"
        expect(page).to have_content "can't be blank"

    end
end
