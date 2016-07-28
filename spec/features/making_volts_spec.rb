require "rails_helper"
#
 RSpec.feature "Users can create new snips" do
     before do
         visit "/"
         click_link "New volt?"
     end
#
     scenario "with valid attributes" do
#
#         fill_in "Name", with: "Hello whirled"
#         fill_in "Summary", with: "My first program - a parody"
#         click_button "Make volt?"
# needs to be manually tested for now as depends on the browser running JS
#         #expect(page).to have_content "Volt made"
#
#         #volt = volt.find_by(name: "Hello whirled")
#         #expect(page.current_url).to eq snip_url(volt)
#
#         #title = "Hello whirled - snipVolt"
#         #expect(page).to have_title title
#     end
#     scenario"when providing invalid attributes" do
#         click_button "Make volt?"
#         expect(page).to have_content "Volt not made"
#         expect(page).to have_content "can't be blank"
#
     end
 end
