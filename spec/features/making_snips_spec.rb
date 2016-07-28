require "rails_helper"

RSpec.feature "Users can create new snips" do
    before do
        visit "/"
        click_link "New snip?"
    end

    scenario "with valid attributes" do

        fill_in "Name", with: "Hello whirled"
        fill_in "Summary", with: "My first program - a parody"
        click_button "Make snip?"
# needs to be manually tested for now as depends on the browser running JS
        #expect(page).to have_content "Snip made"

        #snip = Snip.find_by(name: "Hello whirled")
        #expect(page.current_url).to eq snip_url(snip)

        #title = "Hello whirled - snipVolt"
        #expect(page).to have_title title
    end
    scenario"when providing invalid attributes" do
        click_button "Make snip?"
        expect(page).to have_content "Snip not made"
        expect(page).to have_content "can't be blank"

    end
end
