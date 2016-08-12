require "rails_helper"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

 RSpec.feature "Users can create new volts" do
     let(:user) {FactoryGirl.create(:user, :admin)}
     before do
     end
     scenario "with valid attributes",js:true do

         login_as(user)
         sleep(5)
         visit "/"
         click_link "New volt?"
         fill_in "Name", with: "Hello whirled"
         fill_in "Project name", with: "My first program - a parody"
             select "MIT", :from => "Default licence"
         click_button "Make volt?"

         expect(page).to have_content "Volt made"
         expect(page).to have_content "Author #{user.email}"

         volt = Volt.find_by(name: "Hello whirled")
         expect(page.current_url).to eq volt_url(volt)

         title = "Hello whirled - snipVolt"
         expect(page).to have_title title
    end

end
