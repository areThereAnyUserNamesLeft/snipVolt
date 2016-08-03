require "rails_helper"


Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

RSpec.feature "Users can view snips" do
    let!(:user) {FactoryGirl.create(:user)}
    let(:volt){FactoryGirl.create(:volt, name: "My snipVolt", project_name: "My first volt", default_licence: "MIT")}

    before do
            login_as(user)
            assign_role!(user, :viewer,volt)
            visit "/"
            click_link "My snipVolt"

        end
    scenario "with snip details", js:true do
        click_link "Add snip?"
        fill_in "Name", with: "Hello whirled"
        fill_in "Summary", with: "My first program - a parody"

        fill_in_editor_field "puts 'Hello World'"
        expect(page).to have_editor_display text: "puts 'Hello World'"
        click_button "Make snip?"
        expect(page).to have_content "Hello whirled"




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
