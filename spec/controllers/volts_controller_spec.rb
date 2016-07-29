require 'rails_helper'

RSpec.describe VoltsController, type: :controller do
        it "handles a missing  volt correctly" do
            get :show, id: "not-here"

            expect(response).to redirect_to(volts_path)

            message = "You seem to be looking for things that do not exist - why not try cryptozoology next time?"
            expect(flash[:alert]).to eq message

        end
end
