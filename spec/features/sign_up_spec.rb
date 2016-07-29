require "rails_helper"

RSpec.feature "Users can sign up" do
    before do
        visit "/"
        click_link "Sign up"
        fill_in "Email", with: "test@example.com"
        fill_in "user_password", with: "password"
    end
    scenario "with valid details" do

        fill_in "Password confirmation", with: "password"
        click_button "Sign up"
        expect(page).to have_content "You have signed up successfully."

    end
    scenario"when providing invalid attributes" do
        fill_in "Password confirmation", with: "MarkyMarkAndTheFunkyOnes"
        click_button "Sign up"
        expect(page).to have_content "Password confirmationdoesn't match Password"


    end
end
