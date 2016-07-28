require "rails_helper"

RSpec.feature "Users can delete snips" do
    scenario "successfully" do
        FactoryGirl.create(:snip, name: "Hello Whirled", summary: "My first program - a parody", code: "print('Hello Whirled')")

        visit "/"

        click_link "Hello Whirled"
        click_link "Delete snip?"
        expect(page).to have_content "Snip has been terminated with extreme prejudice"
        expect(page.current_url).to eq snips_url
        expect(page).to have_no_content "Hello Whirled"

    end
end
