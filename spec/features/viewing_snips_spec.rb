require "rails_helper"

RSpec.feature "Users can view snips" do
    scenario "with snip details" do
        snip = FactoryGirl.create(:snip, name: "Hello Whirled", summary: "My first program - a parody", code: "print('Hello Whirled')")

        visit "/"

        click_link "Hello Whirled"
        expect(page.current_url).to eq snip_url(snip)

    end
end
    
