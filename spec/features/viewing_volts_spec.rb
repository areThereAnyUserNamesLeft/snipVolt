require "rails_helper"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

RSpec.feature "Users can view volts" do
    let(:user) {FactoryGirl.create(:user)}
    let(:volt) {FactoryGirl.create(:volt, name: "test snip volt")}
    before do
        login_as(user)
        assign_role!(user, :viewer, volt)
    end
        scenario "with the volt details" do
        visit "/"
        click_link "test snip volt"
        expect(page.current_url).to eq volt_url(volt)
    end
        scenario "unless they do not have permission" do
            FactoryGirl.create(:volt, name: "Hidden")
        visit "/"
        expect(page).not_to have_content "Hidden"
    end

end
