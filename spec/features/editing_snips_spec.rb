require "rails_helper"

RSpec.feature "Users can edit existing snips" do
    before do
            snip = FactoryGirl.create(:snip, name: "Hello Whirled", summary: "My first program - a parody", code: "print('Hello Whirled')")



        visit "/"

        click_link "Hello Whirled"
        click_link "Update snip?"
    end
    scenario "with snip details" do
        fill_in "Name", with: "Hello world"
        click_button "Make snip?"
        expect(page).to have_content "Snip has been updated"
        expect(page).to have_content "Hello world"
    end
    scenario "with snip wrong details" do
        fill_in "Name", with: ""
        click_button "Make snip?"
        expect(page).to have_content "Snip has not been updated"
    end
end
