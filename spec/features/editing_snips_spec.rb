require "rails_helper"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

RSpec.feature "Users can edit snips make snip", js:true do
    let!(:user) {FactoryGirl.create(:user)}
    let(:volt) {FactoryGirl.create(:volt, name: "My snipVolt", project_name: "My first volt", default_licence: "MIT")}
    before do

            login_as(user)
            assign_role!(user, :viewer, volt)
            visit volt_path(volt)

            click_link "Add snip?"
            fill_in "Name", with: "Snippy snip"
            fill_in "Summary", with: "Hello world is a cool program"
            fill_in_editor_field "puts 'Hello World'"
            expect(page).to have_editor_display text: "puts 'Hello World'"
            click_button "Make snip?"
            expect(page).to have_content "Snip has been created."
            expect(page).to have_content "Snippy snip"
            click_link "Parent volt?"
        end
        scenario "users can edit snips", js:true do
            visit "/"
            click_link "My snipVolt"
            click_link "Snippy snip"
            click_link "Update snip?"
            fill_in "Name", with: "Snoopy is cool"
            select "BSD", :from => "Licence"
            fill_in_editor_field "print 'Hello World'"
            expect(page).to have_editor_display text: "print 'Hello World'"
            click_button "Make snip?"
            visit "/"
            expect(page).to have_content "My snipVolt"
            click_link "My snipVolt"
            expect(page).to have_content "Snoopy is cool"
    
    end
end

private

  def fill_in_editor_field(text)
    find_ace_editor_field.set text
  end

  # Ace uses textarea.ace_text-input as
  # its input stream.
  def find_ace_editor_field
    input_field_locator = ".ace_text-input"
    is_input_field_visible = false
    find(input_field_locator, visible: is_input_field_visible)
  end

  # Ace uses div.ace_content as its
  # output stream to display the code
  # entered in the textarea.
  def have_editor_display(options)
    editor_display_locator = ".ace_content"
    have_css(editor_display_locator, options)
  end
