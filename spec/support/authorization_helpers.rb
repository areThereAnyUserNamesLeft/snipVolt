module AuthorizationHelpers
    def assign_role!(user, role, volt)
        Role.where(user: user, volt: volt).delete_all
        Role.create!(user: user, role: role, volt: volt)
    end
end
RSpec.configure do |c|
    c.include AuthorizationHelpers
end
