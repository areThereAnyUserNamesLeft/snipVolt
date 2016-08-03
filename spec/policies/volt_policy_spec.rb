require 'rails_helper'

describe VoltPolicy do

  let(:user) { User.new }

  subject { VoltPolicy }

  permissions ".scope" do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :create? do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  context "policy_scope" do
      subject { Pundit.policy_scope(user, Volt) }

      let!(:volt) { FactoryGirl.create :volt }
      let(:user) { FactoryGirl.create :user }
      it "is empty for anonymous users" do
          expect(Pundit.policy_scope(nil, Volt)).to be_empty
      end

      it "includes volts a user is allowed to view" do
          assign_role!(user,:viewer, volt)
          expect(subject).to include(volt)
      end

      it "doesn't include volts a user is not allowed to view" do
          expect(subject).to be_empty
      end


      it "returns all projects for admins" do
          user.admin = true
          expect(Pundit.policy_scope(nil, Volt)).to be_empty
      end
  end

  permissions :show? do
      let(:user) {FactoryGirl.create :user }
      let(:volt) {FactoryGirl.create :volt }
      it "blocks anon users" do
          expect(subject).not_to permit(nil, volt)
      end
      it "allows viewers to see volt" do
          assign_role!(user, :viewer, volt)
          expect(subject).to permit(user, volt)
      end
      it "allows editors of the volt" do
          assign_role!(user, :editor, volt)
          expect(subject).to permit(user, volt)
      end
      it "allows managers of the volt" do
          assign_role!(user, :manager, volt)
          expect(subject).to permit(user, volt)
      end
      it "allows administrators" do
          assign_role!(user, :admin, volt)
          expect(subject).to permit(user, volt)
      end
      it "doesn't allow users assigned to other volts" do
          other_volt = FactoryGirl.create :volt
          assign_role!(user, :manager, other_volt)
          expect(subject).not_to permit(user, volt)
      end




    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :update? do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :destroy? do
    pending "add some examples to (or delete) #{__FILE__}"
  end
end
