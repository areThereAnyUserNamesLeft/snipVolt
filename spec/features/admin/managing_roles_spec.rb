require "rails_helper"

RSpec.feature "Admins can manage a user's roles" do
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:user) { FactoryGirl.create(:user) }

  let!(:snipVolt) { FactoryGirl.create(:volt, name: "My snipVolt", project_name: "My first volt", default_licence: "MIT")}
  let!(:OtherVolt) { FactoryGirl.create(:volt, name: "OtherVolt", project_name: "My Next volt", default_licence: "MIT")}

  before do
    login_as(admin)
  end

  scenario "when assigning roles to an existing user" do
    visit admin_user_path(user)
    click_link "Edit User"

    select "Viewer", from: "My snipVolt"
    select "Manager", from: "OtherVolt"

    click_button "Update User"
    expect(page).to have_content "User has been updated"

    click_link user.email
    expect(page).to have_content "My snipVolt: Viewer"
    expect(page).to have_content "OtherVolt: Manager"
  end

  scenario "when assigning roles to a new user" do
    visit new_admin_user_path

    fill_in "Email", with: "newuser@ticketee.com"
    fill_in "Password", with: "password"

    select "Editor", from: "My snipVolt"
    click_button "Create User"

    click_link "newuser@ticketee.com"
    expect(page).to have_content "My snipVolt: Editor"
    expect(page).not_to have_content "OtherVolt"
  end
end
