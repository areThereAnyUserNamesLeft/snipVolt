require "rails_helper"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

RSpec.feature "Users can create new snips" do
    let!(:user) {FactoryGirl.create(:user)}
    let(:volt){FactoryGirl.create(:volt, name: "My snipVolt", project_name: "My first volt", default_licence: "MIT")}

    before do
            login_as(user)
            assign_role!(user, :editor ,volt)
            visit "/"
            click_link "My snipVolt"
    end

    scenario "with valid attributes", js:true do
        click_link "Add snip?"
        fill_in "Name", with: "Hello whirled"
        fill_in "Summary", with: "My first program - a parody"

        fill_in_editor_field "puts 'Hello World'"
        expect(page).to have_editor_display text: "puts 'Hello World'"
        click_button "Make snip?"
        expect(page).to have_content "Hello whirled"
        expect(page).to have_content "Snip has been created."
         expect(page).to have_content "Author #{user.email}"

        snip = Snip.find_by(name: "Hello whirled")


        title = "Hello whirled - snipVolt"
        expect(page).to have_title title
    end
    scenario"when providing invalid attributes" do
        click_link "Add snip?"
        click_button "Make snip?"
        expect(page).to have_content "Snip not made"
        expect(page).to have_content "can't be blank"

    end
end
