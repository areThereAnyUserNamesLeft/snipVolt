require "rails_helper"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

 RSpec.feature "Users can only see appropriate links" do

     let(:user) {FactoryGirl.create(:user)}
     let(:admin) {FactoryGirl.create(:user, :admin)}
     let(:volt) {FactoryGirl.create(:volt, name: "My snipVolt", project_name: "My first volt", default_licence: "MIT")}

    #  context "anonymous users" do
    #      scenario "cannot see the New volt link" do
    #      visit "/"
    #      expect(page).not_to have_link "New volt?"
    #     end
    # end
    #  context "regular users" do
    #      before {login_as(user)}
     #
     #
    #  scenario "can see the 'New volt?' link" do
    #      assign_role!(user, :viewer, volt)
    #      visit "/"
    #      expect(page).to have_link "New volt?"
    #      end
# end
#     context "non-logged in users" do
#         scenario "cannot see the Edit volts link" do
#         visit volt_path(volt)
#         expect(page).not_to have_link "Edit volt?"
#     end
# end
#
#      context "admin users" do
#          before {login_as(admin)}
#
#      scenario "can see the 'New volt?' link" do
#          visit "/"
#          expect(page).to have_link "New volt?"
#          end
#
#          scenario "can see the Edit volts link" do
#          visit volt_path(volt)
#          expect(page).to have_link "Edit volt?"
#      end
  # end
end
